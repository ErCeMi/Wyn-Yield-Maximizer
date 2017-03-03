require 'date'
#Units and prices
#@@prices = []
@#@units = []
#@@price_spread = []
#@@number_of_properties = Property.distinct.count('name')
@@unique_properties = Property.uniq.pluck(:name)
@@unique_bedrooms = [1,2,3]
#@@vacant = Property.where(group: "Vacant Unrented")
#@@notice = Property.where(group: "Notice Unrented")
#@@available = @@vacant + @@notice
#@@reportAvailable = @@available.as_json(only: [:unit, :unit_rent])
#@@reportAvailable.each {|i| @@prices << i["unit_rent"]}
#@@reportAvailable.each {|i| @@units << i["unit"]}
#@@prices.each {|i| @@price_spread << i * 0.0225}
#@@yes = []
#@@units.zip(@@prices) do |a,b|
#  @@yes << [a,b]
#end

@@months_array = [
@@t7months = 7.months.from_now.strftime("%m/%Y"),
@@t8months = 8.months.from_now.strftime("%m/%Y"),
@@t9months = 9.months.from_now.strftime("%m/%Y"),
@@t10months = 10.months.from_now.strftime("%m/%Y"),
@@t11months = 11.months.from_now.strftime("%m/%Y"),
@@t12months = 12.months.from_now.strftime("%m/%Y"),
@@t13months = 13.months.from_now.strftime("%m/%Y"),
@@t14months = 14.months.from_now.strftime("%m/%Y"),
@@t15months = 15.months.from_now.strftime("%m/%Y"),
@@t16months = 16.months.from_now.strftime("%m/%Y"),
@@t17months = 17.months.from_now.strftime("%m/%Y"),
@@t18months = 18.months.from_now.strftime("%m/%Y"),
@@t19months = 19.months.from_now.strftime("%m/%Y"),
@@t20months = 20.months.from_now.strftime("%m/%Y"),
@@t21months = 21.months.from_now.strftime("%m/%Y"),
@@t22months = 22.months.from_now.strftime("%m/%Y"),
@@t23months = 23.months.from_now.strftime("%m/%Y"),
@@t24months = 24.months.from_now.strftime("%m/%Y")]

@@t1prop1bdrm = [
@@t1stprop1bdrm7months = 0,
@@t1stprop1bdrm8months = 0,   #7 months
@@t1stprop1bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop1bdrm21months = 0,
@@t1stprop1bdrm22months = 0,
@@t1stprop1bdrm23months = 0,
@@t1stprop1bdrm24months = 0]

@@t1prop2bdrm= [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop2bdrm10months = 0,
@@t1stprop2bdrm11months = 0,
@@t1stprop2bdrm12months = 0,
@@t1stprop2bdrm13months = 0,
@@t1stprop2bdrm14months = 0,
@@t1stprop2bdrm15months = 0,
@@t1stprop2bdrm16months = 0,
@@t1stprop2bdrm17months = 0,
@@t1stprop2bdrm18months = 0,
@@t1stprop2bdrm19months = 0,
@@t1stprop2bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t1prop3bdrm = [
@@t1stprop3bdrm7months = 0,
@@t1stprop3bdrm8months = 0,   #7 months
@@t1stprop3bdrm9months = 0,
@@t1stprop3bdrm10months = 0,
@@t1stprop3bdrm11months = 0,
@@t1stprop3bdrm12months = 0,
@@t1stprop3bdrm13months = 0,
@@t1stprop3bdrm14months = 0,
@@t1stprop3bdrm15months = 0,
@@t1stprop3bdrm16months = 0,
@@t1stprop3bdrm17months = 0,
@@t1stprop3bdrm18months = 0,
@@t1stprop3bdrm19months = 0,
@@t1stprop3bdrm20months = 0,
@@t1stprop3bdrm21months = 0,
@@t1stprop3bdrm22months = 0,
@@t1stprop3bdrm23months = 0,
@@t1stprop3bdrm24months = 0]

@@t2prop1bdrm = [
@@t2prop1bdrm7months = 0,
@@t2prop2bdrm8months = 0,   #7 months
@@t2prop2bdrm9months = 0,
@@t2prop1bdrm10months = 0,
@@t2prop1bdrm11months = 0,
@@t2prop1bdrm12months = 0,
@@t2prop1bdrm13months = 0,
@@t2tprop1bdrm14months = 0,
@@t2prop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t2prop2bdrm23months = 0,
@@t2prop2bdrm24months = 0]

@@t2prop2bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t2prop3bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t3prop1bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t3prop2bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t3prop3bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t4prop1bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t4prop2bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

@@t4prop3bdrm = [
@@t1stprop2bdrm7months = 0,
@@t1stprop2bdrm8months = 0,   #7 months
@@t1stprop2bdrm9months = 0,
@@t1stprop1bdrm10months = 0,
@@t1stprop1bdrm11months = 0,
@@t1stprop1bdrm12months = 0,
@@t1stprop1bdrm13months = 0,
@@t1stprop1bdrm14months = 0,
@@t1stprop1bdrm15months = 0,
@@t1stprop1bdrm16months = 0,
@@t1stprop1bdrm17months = 0,
@@t1stprop1bdrm18months = 0,
@@t1stprop1bdrm19months = 0,
@@t1stprop1bdrm20months = 0,
@@t1stprop2bdrm21months = 0,
@@t1stprop2bdrm22months = 0,
@@t1stprop2bdrm23months = 0,
@@t1stprop2bdrm24months = 0]

#@@lease_to_array = []
#@@lease_to_array_formated = []
#@@rank = []
#@@available.as_json.each {|i| @@lease_to_array << i["lease_to"] }
#@@lease_to_array.each {|i| @@lease_to_array_formated << i.strftime("%m/%Y") if i != nil}


@@unique_properties.each { |a| @@unique_bedrooms.each { |b| @@rank << Property.where("name = ? AND bedroom = ?", a, b).as_json(only: [:name, :bedroom, :lease_to])}}


#@@count = 0
#(0..@@rank.length).each {|a| @@rank[a - 1].each {|b| b["lease_to"] != nil ? (@@count += 1 if b["lease_to"].strftime("%m/%Y").to_s == @@t7months.to_s) : (@@count + 0)}}



#(0..(@@rank.length - 1)).each {|a| @@rank[a].each {|b| b["lease_to"] != nil ? ( @@count_array.each { |c| @@months_array.each { |d| (c += 1 if b["lease_to"].strftime("%m/%Y").to_s == d.to_s)}}) : (@@count + 0)}}
#@@garbage = 0
#(0..(@@rank.length - 1)).each {|a| @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@count_array[@@months_array.index(c)] += 1) : (@@garbage += 1)  }): (@@garbage += 1) }}

#@@garbage = 0
#(0..(@@rank.length - 1)).each {|a| @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@count_array.map! {|x| x == @@count_array[@@months_array.index(c)] ? (@@count_array[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }}

@@garbage = 0
(0..(@@rank.length - 1)).each do |a|
case a
when 0
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t1prop1bdrm.map! {|x| x == @@t1prop1bdrm[@@months_array.index(c)] ? (@@t1prop1bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 1
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t1prop2bdrm.map! {|x| x == @@t1prop2bdrm[@@months_array.index(c)] ? (@@t1prop2bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 2
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t1prop3bdrm.map! {|x| x == @@t1prop3bdrm[@@months_array.index(c)] ? (@@t1prop3bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 3
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t2prop1bdrm.map! {|x| x == @@t2prop1bdrm[@@months_array.index(c)] ? (@@t2prop1bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 4
@@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t2prop2bdrm.map! {|x| x == @@t2prop2bdrm[@@months_array.index(c)] ? (@@t2prop2bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 5
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t2prop3bdrm.map! {|x| x == @@t2prop3bdrm[@@months_array.index(c)] ? (@@t2prop3bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 6
@@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t3prop1bdrm.map! {|x| x == @@t3prop1bdrm[@@months_array.index(c)] ? (@@t3prop1bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 7
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t3prop2bdrm.map! {|x| x == @@t3prop2bdrm[@@months_array.index(c)] ? (@@t3prop2bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 8
@@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t3prop3bdrm.map! {|x| x == @@t3prop3bdrm[@@months_array.index(c)] ? (@@t3prop3bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 9
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t4prop1bdrm.map! {|x| x == @@t4prop1bdrm[@@months_array.index(c)] ? (@@t4prop1bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 10
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t4prop2bdrm.map! {|x| x == @@t4prop2bdrm[@@months_array.index(c)] ? (@@t4prop2bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
when 11
  @@rank[a].each {|b| b["lease_to"] != nil ? (@@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@@t4prop3bdrm.map! {|x| x == @@t4prop3bdrm[@@months_array.index(c)] ? (@@t4prop3bdrm[@@months_array.index(c)] += 1) : x } ) : (@@garbage += 1)  }): (@@garbage += 1) }
else
  @@garbage +=1
end
end
# Grove 1 bedrooms

#PROP 0
#PROP 3
#PROP 6   1 bedrooms
#PROP 9

#PROP 1
#PROP 4
#PROP 7   2 bedrooms
#PROP 10

#PROP 2
#PROP 5
#PROP 8   3 bedrooms
#PROP 11



class Report


  def self.text(property)
     "#{@@count_array}"
  end

end
