require 'date'
#Units and prices
@@prices = []
@@units = []
@@price_spread = []
@@number_of_properties = Property.distinct.count('name')
@@unique_properties = Property.uniq.pluck(:name)
@@unique_bedrooms = [1,2,3]
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
@@t7months = 0.months.from_now.strftime("%m/%Y")
@@t8months = 8.months.from_now.strftime("%m/%Y")
@@t9months = 9.months.from_now.strftime("%m/%Y")
@@t10months = 10.months.from_now.strftime("%m/%Y")
@@t11months = 11.months.from_now.strftime("%m/%Y")
@@t12months = 12.months.from_now.strftime("%m/%Y")
@@t13months = 13.months.from_now.strftime("%m/%Y")
@@t14months = 14.months.from_now.strftime("%m/%Y")
@@t15months = 15.months.from_now.strftime("%m/%Y")
@@t16months = 16.months.from_now.strftime("%m/%Y")
@@t17months = 17.months.from_now.strftime("%m/%Y")
@@t18months = 18.months.from_now.strftime("%m/%Y")
@@t19months = 19.months.from_now.strftime("%m/%Y")
@@t20months = 20.months.from_now.strftime("%m/%Y")
@@t21months = 21.months.from_now.strftime("%m/%Y")
@@t22months = 22.months.from_now.strftime("%m/%Y")
@@t23months = 23.months.from_now.strftime("%m/%Y")
@@t24months = 24.months.from_now.strftime("%m/%Y")
@@lease_to_array = []
@@lease_to_array_formated = []
@@rank = []
@@available.as_json.each {|i| @@lease_to_array << i["lease_to"] }
@@lease_to_array.each {|i| @@lease_to_array_formated << i.strftime("%m/%Y") if i != nil}


@@unique_properties.each { |a| @@unique_bedrooms.each { |b| @@rank << Property.where("name = ? AND bedroom = ?", a, b).as_json(only: [:name, :bedroom, :lease_to])}}


@@count = 0
(0..@@rank.length).each {|a| @@rank[a - 1].each {|b| b["lease_to"] != nil ? (@@count += 1 if b["lease_to"].strftime("%m/%Y").to_s == @@t7months.to_s) : (@@count + 0)}}



class Report


  def self.text(property)
     "#{@@rank[0]}"
  end

end
