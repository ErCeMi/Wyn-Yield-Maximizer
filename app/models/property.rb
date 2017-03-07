class Property < ApplicationRecord
  belongs_to :company

  # @prices = []
  # @price_spread = []
  # @vacant = Property.where(group: "Vacant Unrented")
  # @notice = Property.where(group: "Notice Unrented")
  # @available = @vacant + @notice
  # @available.as_json(only: [:unit_rent])
  # @available.each {|i| @prices << i["unit_rent"]}
  # @prices.each {|i| @price_spread << i * 0.0225}

  # This should be an associaiton to a building model
  def self.building_names
    self.pluck(:name).uniq
  end

  ##
  GROUP_VACANT = "Vacant Unrented"
  GROUP_NOTICE = "Notice Unrented"
  def self.vacant
    self.where(group: GROUP_VACANT)
  end

  def self.notice
    self.where(group: GROUP_NOTICE)
  end

  def self.available
    self.vacant.or(self.notice)
  end
  ##

  # MONTH_RANGE = (7..24)

  class PerBedPremium
    def initialize building_name, lease_terms
      one_br = num_expirations_by_month lease_terms, building_name, 1
      one_br_ranks = PerBedPremium.calculate_ranks one_br
      @one_br_premiums = calculate_premiums lease_terms, one_br_ranks

      two_br = num_expirations_by_month lease_terms, building_name, 2
      two_br_ranks = PerBedPremium.calculate_ranks two_br
      @two_br_premiums = calculate_premiums lease_terms, two_br_ranks

      three_br = num_expirations_by_month lease_terms, building_name, 3
      three_br_ranks = PerBedPremium.calculate_ranks three_br
      @three_br_premiums = calculate_premiums lease_terms, three_br_ranks

    end
    # number of units expiring at various lease lengths
    def num_expirations_by_month(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now.next_month(8)
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        Property.where(name: building_name, bedroom: num_bedrooms,
          lease_to: (month_range.beginning_of_month..month_range.end_of_month)
          ).count
      }
    end
    # reverse (golf) rank an array of scores
    def self.calculate_ranks brs_expiring_per_month
      sorted_brs = brs_expiring_per_month.sort.uniq
      brs_expiring_per_month.map do |br|
        (sorted_brs.index(br) + 1)
      end
    end


    # calculate prorated premiums based on reverse ranks
    PREMIUM = 75
    def calculate_premiums lease_terms, brs_ranks
      num_lease_terms = lease_terms.size.to_f
      coeffs = {}
      brs_ranks.each_with_index do |rank, idx|
        coeffs[lease_terms[idx]] = ((rank - 1) / (num_lease_terms - 1) * PREMIUM).ceil
      end
      coeffs
    end

    def premiums_per_bedroom bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums
      when 2
        @two_br_premiums
      when 3
        @three_br_premiums
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end

    def calculate_rent(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom(bedroom_count)[lease_end_month]
    end
  end
end
