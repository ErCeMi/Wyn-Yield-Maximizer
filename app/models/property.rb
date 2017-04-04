class Property < ApplicationRecord

  belongs_to :company
  belongs_to :unit_type
  has_many :property_names, through: :unit_type


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
    PropertyName.pluck(:name).uniq

  end

  ##
  GROUP_VACANT =   "Vacant Unrented Ready"
  GROUP_NOTICE = "Notice Unrented"
  $premium = 1.015
  def self.vacant_ready
    self.where(group: "Vacant Unrented Ready")
  end
  def self.vacant_notready
    self.where(group:  "Vacant Unrented Not Ready")
  end

  def self.notice
    self.where(group: GROUP_NOTICE)
  end

  def self.available
    self.vacant_ready.or(self.notice).or(self.vacant_notready)
  end

  def self.renewing
    self.where(lease_to: ((DateTime.now.beginning_of_month)..(DateTime.now.next_month(4).end_of_month)))
  end

  def self.available_per_prop(prop_name)
    # self.available.where(name: prop_name)
    (self.available.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => prop_name})
  end

  def self.renewing_per_prop(prop_name)
    (self.renewing.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => prop_name})
  end
  ##


  # MONTH_RANGE = (7..24)

  class PerBedPremium
    def initialize building_name, lease_terms
      one_br0 = num_expirations_by_month_0 lease_terms, building_name, 1
      one_br_ranks0 = PerBedPremium.calculate_ranks one_br0
      @one_br_premiums0 = calculate_premiums lease_terms, one_br_ranks0

      two_br0 = num_expirations_by_month_0 lease_terms, building_name, 2
      two_br_ranks0 = PerBedPremium.calculate_ranks two_br0
      @two_br_premiums0 = calculate_premiums lease_terms, two_br_ranks0

      three_br0 = num_expirations_by_month_0 lease_terms, building_name, 3
      three_br_ranks0 = PerBedPremium.calculate_ranks three_br0
      @three_br_premiums0 = calculate_premiums lease_terms, three_br_ranks0



      one_br1 = num_expirations_by_month_1 lease_terms, building_name, 1
      one_br_ranks1 = PerBedPremium.calculate_ranks one_br1
      @one_br_premiums1 = calculate_premiums lease_terms, one_br_ranks1

      two_br1 = num_expirations_by_month_1 lease_terms, building_name, 2
      two_br_ranks1 = PerBedPremium.calculate_ranks two_br1
      @two_br_premiums1 = calculate_premiums lease_terms, two_br_ranks1

      three_br1 = num_expirations_by_month_1 lease_terms, building_name, 3
      three_br_ranks1 = PerBedPremium.calculate_ranks three_br1
      @three_br_premiums1 = calculate_premiums lease_terms, three_br_ranks1



      one_br2 = num_expirations_by_month_2 lease_terms, building_name, 1
      one_br_ranks2 = PerBedPremium.calculate_ranks one_br2
      @one_br_premiums2 = calculate_premiums lease_terms, one_br_ranks2

      two_br2 = num_expirations_by_month_2 lease_terms, building_name, 2
      two_br_ranks2 = PerBedPremium.calculate_ranks two_br2
      @two_br_premiums2 = calculate_premiums lease_terms, two_br_ranks2

      three_br2 = num_expirations_by_month_2 lease_terms, building_name, 3
      three_br_ranks2 = PerBedPremium.calculate_ranks three_br2
      @three_br_premiums2 = calculate_premiums lease_terms, three_br_ranks2



      one_br3 = num_expirations_by_month_3 lease_terms, building_name, 1
      one_br_ranks3 = PerBedPremium.calculate_ranks one_br3
      @one_br_premiums3 = calculate_premiums lease_terms, one_br_ranks3

      two_br3 = num_expirations_by_month_3 lease_terms, building_name, 2
      two_br_ranks3 = PerBedPremium.calculate_ranks two_br3
      @two_br_premiums3 = calculate_premiums lease_terms, two_br_ranks3

      three_br3 = num_expirations_by_month_3 lease_terms, building_name, 3
      three_br_ranks3 = PerBedPremium.calculate_ranks three_br3
      @three_br_premiums3 = calculate_premiums lease_terms, three_br_ranks3



      one_br4 = num_expirations_by_month_4 lease_terms, building_name, 1
      one_br_ranks4 = PerBedPremium.calculate_ranks one_br4
      @one_br_premiums4 = calculate_premiums lease_terms, one_br_ranks4

      two_br4 = num_expirations_by_month_4 lease_terms, building_name, 2
      two_br_ranks4 = PerBedPremium.calculate_ranks two_br4
      @two_br_premiums4 = calculate_premiums lease_terms, two_br_ranks4

      three_br4 = num_expirations_by_month_4 lease_terms, building_name, 3
      three_br_ranks4 = PerBedPremium.calculate_ranks three_br4
      @three_br_premiums4 = calculate_premiums lease_terms, three_br_ranks4



      one_br5 = num_expirations_by_month_5 lease_terms, building_name, 1
      one_br_ranks5 = PerBedPremium.calculate_ranks one_br5
      @one_br_premiums5 = calculate_premiums lease_terms, one_br_ranks5

      two_br5 = num_expirations_by_month_5 lease_terms, building_name, 2
      two_br_ranks5= PerBedPremium.calculate_ranks two_br5
      @two_br_premiums5 = calculate_premiums lease_terms, two_br_ranks5

      three_br5 = num_expirations_by_month_5 lease_terms, building_name, 3
      three_br_ranks5 = PerBedPremium.calculate_ranks three_br5
      @three_br_premiums5 = calculate_premiums lease_terms, three_br_ranks5



    end

    # This method can be modular by passing in next_month variable
    # def num_expirations_by_month (next_month, lease_lengths, building_name, num_bedrooms)
    #
    #   # Set the current date
    #   current_date = DateTime.now
    #
    #   # If next_month is set, reset current_date to next_month months in the future
    #   if (next_month > 0)
    #
    #     current_date = DateTime.now.next_month(next_month)
    #   end
    #
    #   # This is what will be returned
    #   results = []
    #
    #   # Iterate through the lease lengths
    #   lease_lengths.map { |month|
    #
    #     # Stores unix timestamp. This is the time when you're going to check if the lease is up.
    #     check_lease_in = (current_date + month.months)
    #     start_of_month = check_lease_in.beginning_of_month.to_i
    #     end_of_month = check_lease_in.end_of_month.to_i
    #
    #     # Find the property_name object we're looking
    #     property_name = PropertyName.where(name: building_name)[0]
    #
    #     # Grab that property_name's unit_types filtered by num of bedrooms
    #     unit_types = property_name.unit_types.where(bedroom: num_bedrooms)
    #
    #
    #     # Iterate through unit_types to find
    #     unit_types.map { |ut|
    #
    #       # Loop through unit_type's properties to extract dates
    #       ut.properties.map { |property|
    #
    #         # Turn lease_to into a unix timestamp
    #         lease_to = property.lease_to.to_datetime.to_i
    #
    #         if lease_to >= start_of_month && lease_to <= end_of_month
    #
    #           results.push property
    #         end
    #
    #       }
    #
    #     }
    #   }
    #
    #   # Return the results
    #   results
    # end

    # number of units expiring at various lease lengths
    def num_expirations_by_month_0(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        (Property.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => building_name}, :unit_types => {bedroom: num_bedrooms}, lease_to: (month_range.beginning_of_month..month_range.end_of_month)).count
      }
    end




    def num_expirations_by_month_1(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now.next_month(1)
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        (Property.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => building_name}, :unit_types => {bedroom: num_bedrooms}, lease_to: (month_range.beginning_of_month..month_range.end_of_month)).count
      }
    end

    def num_expirations_by_month_2(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now.next_month(2)
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        (Property.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => building_name}, :unit_types => {bedroom: num_bedrooms}, lease_to: (month_range.beginning_of_month..month_range.end_of_month)).count
      }
    end

    def num_expirations_by_month_3(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now.next_month(3)
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        (Property.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => building_name}, :unit_types => {bedroom: num_bedrooms}, lease_to: (month_range.beginning_of_month..month_range.end_of_month)).count
      }
    end

    def num_expirations_by_month_4(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now.next_month(4)
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        (Property.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => building_name}, :unit_types => {bedroom: num_bedrooms}, lease_to: (month_range.beginning_of_month..month_range.end_of_month)).count
      }
    end

    def num_expirations_by_month_5(lease_lengths, building_name, num_bedrooms)
      current_date = DateTime.now.next_month(5)
      lease_lengths.map { |month|
        month_range = (current_date + month.months)
        (Property.joins(:unit_type).joins(:property_names)).where(:property_names => {:name => building_name}, :unit_types => {bedroom: num_bedrooms}, lease_to: (month_range.beginning_of_month..month_range.end_of_month)).count
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
    PREMIUM = 45
    def calculate_premiums lease_terms, brs_ranks
      num_lease_terms = lease_terms.size.to_f
      coeffs = {}
      brs_ranks.each_with_index do |rank, idx|
        coeffs[lease_terms[idx]] = ((rank - 1) / (num_lease_terms - 1) * PREMIUM).ceil
      end
      coeffs
    end

    def premiums_per_bedroom0 bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums0
      when 2
        @two_br_premiums0
      when 3
        @three_br_premiums0
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end

    def premiums_per_bedroom1 bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums1
      when 2
        @two_br_premiums1
      when 3
        @three_br_premiums1
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end

    def premiums_per_bedroom2 bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums2
      when 2
        @two_br_premiums2
      when 3
        @three_br_premiums2
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end

    def premiums_per_bedroom3 bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums3
      when 2
        @two_br_premiums3
      when 3
        @three_br_premiums3
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end


    def premiums_per_bedroom4 bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums4
      when 2
        @two_br_premiums4
      when 3
        @three_br_premiums4
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end

    def premiums_per_bedroom5 bedroom_count
      case bedroom_count
      when 1
        @one_br_premiums5
      when 2
        @two_br_premiums5
      when 3
        @three_br_premiums5
      else
        # default value to something weird so it's easy to see
        Hash.new(Float::INFINITY)
      end
    end

    def calculate_rent0(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom0(bedroom_count)[lease_end_month]
    end
    def calculate_rent1(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom1(bedroom_count)[lease_end_month]
    end
    def calculate_rent2(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom2(bedroom_count)[lease_end_month]
    end
    def calculate_rent3(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom3(bedroom_count)[lease_end_month]
    end
    def calculate_rent4(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom4(bedroom_count)[lease_end_month]
    end
    def calculate_rent5(unit_rent, bedroom_count, lease_end_month)
      unit_rent + premiums_per_bedroom5(bedroom_count)[lease_end_month]
    end



  end
end
