require 'date'
# def num_expirations_by_month_4(lease_lengths, building_name, num_bedrooms)
   current_date = DateTime.now.next_month(4)
#   lease_lengths.map { |month|
#     month_range = (current_date + month.months)
#     Property.where(name: building_name, bedroom: num_bedrooms,
#       lease_to: (month_range.beginning_of_month..month_range.end_of_month)
#       ).count
#   }
# end


p current_date.strftime("%Y%m")
