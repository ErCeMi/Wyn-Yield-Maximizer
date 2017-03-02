require 'date'
#Units and prices
@@prices = []
@@units = []
@@price_spread = []
@@vacant = Property.where(group: "Vacant Unrented")
@@notice = Property.where(group: "Notice Unrented")
@@available = @@vacant + @@notice
@@reportAvailable = @@available.as_json(only: [:unit, :unit_rent])
@@reportAvailable.each {|i| @@prices << i["unit_rent"]}
@@reportAvailable.each {|i| @@units << i["unit"]}
@@prices.each {|i| @@price_spread << i * 0.0225}
@@yes = []
@@units.zip(@@prices) do |a,b|
  @@yes << [a,b]
end

# Rankings
@@t7months = 7.months.from_now.strftime("%m/%Y")
@@t8months = 8.months.from_now
@@t9months = 9.months.from_now
@@t10months = 10.months.from_now
@@t11months = 11.months.from_now
@@t12months = 12.months.from_now
@@t13months = 13.months.from_now
@@t14months = 14.months.from_now
@@t15months = 15.months.from_now
@@t16months = 16.months.from_now
@@t17months = 17.months.from_now
@@t18months = 18.months.from_now
@@t19months = 19.months.from_now
@@t20months = 20.months.from_now
@@t21months = 21.months.from_now
@@t22months = 22.months.from_now
@@t23months = 23.months.from_now
@@t24months = 24.months.from_now
@@lease_to_array = []
@@lease_to_array_formated = []
@@available.as_json.each {|i| @@lease_to_array << i["lease_to"] }
@@lease_to_array.each {|i| @@lease_to_array_formated << i.strftime("%m/%d/%y") if i != nil}
#0002/17
class Report


  def self.text(property)
     "#{@@lease_to_array_formated}"
  end

  end
