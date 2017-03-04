class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    require 'date'
    #Units and prices
    #@prices = []
    #@units = []
    #@price_spread = []
    #@number_of_properties = Property.distinct.count('name')
    @unique_properties = Property.uniq.pluck(:name)
    @unique_bedrooms = [1,2,3]
    @vacant = Property.where(group: "Vacant Unrented")
    @notice = Property.where(group: "Notice Unrented")
    @available = @vacant + @notice
    @reportAvailable = @available.as_json(only: [:name, :unit, :unit_type, :days_vacant, :amenities, :group, :bedroom, :unit_rent])
    #@reportAvailable.each {|i| @prices << i["unit_rent"]}
    #@reportAvailable.each {|i| @units << i["unit"]}
    #@prices.each {|i| @price_spread << i * 0.0225}
    #@yes = []
    #@units.zip(@prices) do |a,b|
    #  @yes << [a,b]
    #end

    @months_array = [
    @t7months = 7.months.from_now.strftime("%m/%Y"),
    @t8months = 8.months.from_now.strftime("%m/%Y"),
    @t9months = 9.months.from_now.strftime("%m/%Y"),
    @t10months = 10.months.from_now.strftime("%m/%Y"),
    @t11months = 11.months.from_now.strftime("%m/%Y"),
    @t12months = 12.months.from_now.strftime("%m/%Y"),
    @t13months = 13.months.from_now.strftime("%m/%Y"),
    @t14months = 14.months.from_now.strftime("%m/%Y"),
    @t15months = 15.months.from_now.strftime("%m/%Y"),
    @t16months = 16.months.from_now.strftime("%m/%Y"),
    @t17months = 17.months.from_now.strftime("%m/%Y"),
    @t18months = 18.months.from_now.strftime("%m/%Y"),
    @t19months = 19.months.from_now.strftime("%m/%Y"),
    @t20months = 20.months.from_now.strftime("%m/%Y"),
    @t21months = 21.months.from_now.strftime("%m/%Y"),
    @t22months = 22.months.from_now.strftime("%m/%Y"),
    @t23months = 23.months.from_now.strftime("%m/%Y"),
    @t24months = 24.months.from_now.strftime("%m/%Y")]

    @try=[
    @t1prop1bdrm = [
    @t1stprop1bdrm7months = 0,
    @t1stprop1bdrm8months = 0,   #7 months
    @t1stprop1bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop1bdrm21months = 0,
    @t1stprop1bdrm22months = 0,
    @t1stprop1bdrm23months = 0,
    @t1stprop1bdrm24months = 0],

    @t1prop2bdrm= [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop2bdrm10months = 0,
    @t1stprop2bdrm11months = 0,
    @t1stprop2bdrm12months = 0,
    @t1stprop2bdrm13months = 0,
    @t1stprop2bdrm14months = 0,
    @t1stprop2bdrm15months = 0,
    @t1stprop2bdrm16months = 0,
    @t1stprop2bdrm17months = 0,
    @t1stprop2bdrm18months = 0,
    @t1stprop2bdrm19months = 0,
    @t1stprop2bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t1prop3bdrm = [
    @t1stprop3bdrm7months = 0,
    @t1stprop3bdrm8months = 0,   #7 months
    @t1stprop3bdrm9months = 0,
    @t1stprop3bdrm10months = 0,
    @t1stprop3bdrm11months = 0,
    @t1stprop3bdrm12months = 0,
    @t1stprop3bdrm13months = 0,
    @t1stprop3bdrm14months = 0,
    @t1stprop3bdrm15months = 0,
    @t1stprop3bdrm16months = 0,
    @t1stprop3bdrm17months = 0,
    @t1stprop3bdrm18months = 0,
    @t1stprop3bdrm19months = 0,
    @t1stprop3bdrm20months = 0,
    @t1stprop3bdrm21months = 0,
    @t1stprop3bdrm22months = 0,
    @t1stprop3bdrm23months = 0,
    @t1stprop3bdrm24months = 0],

    @t2prop1bdrm = [
    @t2prop1bdrm7months = 0,
    @t2prop2bdrm8months = 0,   #7 months
    @t2prop2bdrm9months = 0,
    @t2prop1bdrm10months = 0,
    @t2prop1bdrm11months = 0,
    @t2prop1bdrm12months = 0,
    @t2prop1bdrm13months = 0,
    @t2tprop1bdrm14months = 0,
    @t2prop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t2prop2bdrm23months = 0,
    @t2prop2bdrm24months = 0],

    @t2prop2bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t2prop3bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t3prop1bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t3prop2bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t3prop3bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t4prop1bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t4prop2bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0],

    @t4prop3bdrm = [
    @t1stprop2bdrm7months = 0,
    @t1stprop2bdrm8months = 0,   #7 months
    @t1stprop2bdrm9months = 0,
    @t1stprop1bdrm10months = 0,
    @t1stprop1bdrm11months = 0,
    @t1stprop1bdrm12months = 0,
    @t1stprop1bdrm13months = 0,
    @t1stprop1bdrm14months = 0,
    @t1stprop1bdrm15months = 0,
    @t1stprop1bdrm16months = 0,
    @t1stprop1bdrm17months = 0,
    @t1stprop1bdrm18months = 0,
    @t1stprop1bdrm19months = 0,
    @t1stprop1bdrm20months = 0,
    @t1stprop2bdrm21months = 0,
    @t1stprop2bdrm22months = 0,
    @t1stprop2bdrm23months = 0,
    @t1stprop2bdrm24months = 0]]

    #@lease_to_array = []
    #@lease_to_array_formated = []
    @rank = []
    #@available.as_json.each {|i| @lease_to_array << i["lease_to"] }
    #@lease_to_array.each {|i| @lease_to_array_formated << i.strftime("%m/%Y") if i != nil}


    @unique_properties.each { |a| @unique_bedrooms.each { |b| @rank << Property.where("name = ? AND bedroom = ?", a, b).as_json(only: [:name, :bedroom, :lease_to])}}


    #@count = 0
    #(0..@rank.length).each {|a| @rank[a - 1].each {|b| b["lease_to"] != nil ? (@count += 1 if b["lease_to"].strftime("%m/%Y").to_s == @t7months.to_s) : (@count + 0)}}



    #(0..(@rank.length - 1)).each {|a| @rank[a].each {|b| b["lease_to"] != nil ? ( @count_array.each { |c| @months_array.each { |d| (c += 1 if b["lease_to"].strftime("%m/%Y").to_s == d.to_s)}}) : (@count + 0)}}
    #@garbage = 0
    #(0..(@rank.length - 1)).each {|a| @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@count_array[@months_array.index(c)] += 1) : (@garbage += 1)  }): (@garbage += 1) }}

    #@garbage = 0
    #(0..(@rank.length - 1)).each {|a| @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@count_array.map! {|x| x == @count_array[@months_array.index(c)] ? (@count_array[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }}

    #sets values to # of expirations per bucket
    @garbage = 0
    (0..(@rank.length - 1)).each do |a|
    case a
    when 0
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t1prop1bdrm.map! {|x| x == @t1prop1bdrm[@months_array.index(c)] ? (@t1prop1bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 1
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t1prop2bdrm.map! {|x| x == @t1prop2bdrm[@months_array.index(c)] ? (@t1prop2bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 2
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t1prop3bdrm.map! {|x| x == @t1prop3bdrm[@months_array.index(c)] ? (@t1prop3bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 3
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t2prop1bdrm.map! {|x| x == @t2prop1bdrm[@months_array.index(c)] ? (@t2prop1bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 4
    @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t2prop2bdrm.map! {|x| x == @t2prop2bdrm[@months_array.index(c)] ? (@t2prop2bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 5
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t2prop3bdrm.map! {|x| x == @t2prop3bdrm[@months_array.index(c)] ? (@t2prop3bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 6
    @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t3prop1bdrm.map! {|x| x == @t3prop1bdrm[@months_array.index(c)] ? (@t3prop1bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 7
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t3prop2bdrm.map! {|x| x == @t3prop2bdrm[@months_array.index(c)] ? (@t3prop2bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 8
    @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t3prop3bdrm.map! {|x| x == @t3prop3bdrm[@months_array.index(c)] ? (@t3prop3bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 9
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t4prop1bdrm.map! {|x| x == @t4prop1bdrm[@months_array.index(c)] ? (@t4prop1bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 10
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t4prop2bdrm.map! {|x| x == @t4prop2bdrm[@months_array.index(c)] ? (@t4prop2bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    when 11
      @rank[a].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@t4prop3bdrm.map! {|x| x == @t4prop3bdrm[@months_array.index(c)] ? (@t4prop3bdrm[@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    else
      @garbage +=1
    end
    end

    #@testdummy = [
    #@t1stprop2bdrm7months = 100,
    #@t1stprop2bdrm8months = 65,   #7 months
    #@t1stprop2bdrm9months = 45,
    #@t1stprop1bdrm10months = 0,
    #@t1stprop1bdrm11months = 23,
    #@t1stprop1bdrm12months = 43,
    #@t1stprop1bdrm13months = 23,
    #@t1stprop1bdrm14months = 17,
    #@t1stprop1bdrm15months = 17,
    #@t1stprop1bdrm16months = 0,
    #@t1stprop1bdrm17months = 123,
    #@t1stprop1bdrm18months = 67,
    #@t1stprop1bdrm19months = 65,
    #@t1stprop1bdrm20months = 32,
    #@t1stprop2bdrm21months = 11,
    #@t1stprop2bdrm22months = 0,
    #@t1stprop2bdrm23months = 0,
    #@t1stprop2bdrm24months = 0]

    #@sorted = @testdummy.sort.uniq

    #@testdummy_ranks = @testdummy.map!{|i| @sorted.index(i) + 1}

    #@bbb = (@try[2].sort.uniq

    #makes values equal to rank
    @try.each do |i|
      z = i.sort.uniq
      i.map! do |b|
        (z.index(b) + 1)
      end
    end

    # makes values equal to spread
    @try.each do |i|
      i.map! do |b|
        ((((b-1).to_f)/11) * 50).round(0)
      end
    end

    @reportAvailable.each do |i|
      if i["name"] == @unique_properties[0] && i["bedroom"] == 1
        i.merge!("seven" => (@try[0][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[0][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[0][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[0][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[0][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[0][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[0][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[0][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[0][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[0][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[0][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[0][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[0][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[0][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[0][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[0][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[0][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[0][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[0] && i["bedroom"] == 2
        i.merge!("seven" => (@try[0][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[0][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[0][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[0][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[0][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[0][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[0][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[0][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[0][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[0][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[0][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[0][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[0][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[0][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[0][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[0][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[0][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[0][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[0] && i["bedroom"] == 3
        i.merge!("seven" => (@try[0][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[0][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[0][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[0][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[0][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[0][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[0][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[0][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[0][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[0][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[0][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[0][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[0][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[0][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[0][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[0][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[0][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[0][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[1] && i["bedroom"] == 1
        i.merge!("seven" => (@try[1][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[1][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[1][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[1][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[1][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[1][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[1][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[1][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[1][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[1][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[1][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[1][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[1][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[1][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[1][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[1][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[1][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[1][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[1] && i["bedroom"] == 2
        i.merge!("seven" => (@try[2][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[2][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[2][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[2][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[2][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[2][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[2][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[2][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[2][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[2][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[2][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[2][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[2][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[2][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[2][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[2][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[2][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[2][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[1] && i["bedroom"] == 3
        i.merge!("seven" => (@try[3][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[3][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[3][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[3][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[3][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[3][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[3][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[3][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[3][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[3][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[3][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[3][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[3][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[3][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[3][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[3][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[3][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[3][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[2] && i["bedroom"] == 1
        i.merge!("seven" => (@try[4][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[4][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[4][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[4][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[4][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[4][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[4][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[4][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[4][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[4][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[4][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[4][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[4][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[4][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[4][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[4][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[4][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[4][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[2] && i["bedroom"] == 2
        i.merge!("seven" => (@try[5][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[5][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[5][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[5][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[5][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[5][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[5][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[5][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[5][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[5][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[5][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[5][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[5][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[5][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[5][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[5][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[5][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[5][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[2] && i["bedroom"] == 3
        i.merge!("seven" => (@try[6][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[6][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[6][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[6][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[6][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[6][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[6][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[6][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[6][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[6][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[6][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[6][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[6][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[6][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[6][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[6][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[6][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[6][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[3] && i["bedroom"] == 1
        i.merge!("seven" => (@try[7][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[7][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[7][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[7][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[7][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[7][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[7][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[7][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[7][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[7][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[7][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[7][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[7][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[7][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[7][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[7][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[7][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[7][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[3] && i["bedroom"] == 2
        i.merge!("seven" => (@try[8][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[8][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[8][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[8][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[8][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[8][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[8][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[8][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[8][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[8][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[8][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[8][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[8][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[8][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[8][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[8][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[8][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[8][17] + i["unit_rent"]))
      elsif i["name"] == @unique_properties[3] && i["bedroom"] == 3
        i.merge!("seven" => (@try[9][0] + i["unit_rent"]))
        i.merge!("eight" => (@try[9][1] + i["unit_rent"]))
        i.merge!("nine" => (@try[9][2] + i["unit_rent"]))
        i.merge!("ten" => (@try[9][3] + i["unit_rent"]))
        i.merge!("eleven" => (@try[9][4] + i["unit_rent"]))
        i.merge!("twelve" => (@try[9][5] + i["unit_rent"]))
        i.merge!("thirteen" => (@try[9][6] + i["unit_rent"]))
        i.merge!("fourteen" => (@try[9][7] + i["unit_rent"]))
        i.merge!("fifteen" => (@try[9][8] + i["unit_rent"]))
        i.merge!("sixteen" => (@try[9][9] + i["unit_rent"]))
        i.merge!("seventeen" => (@try[9][10] + i["unit_rent"]))
        i.merge!("eighteen" => (@try[9][11] + i["unit_rent"]))
        i.merge!("nineteen" => (@try[9][12] + i["unit_rent"]))
        i.merge!("twenty" => (@try[9][13] + i["unit_rent"]))
        i.merge!("twenty-one" => (@try[9][14] + i["unit_rent"]))
        i.merge!("twenty-two" => (@try[9][15] + i["unit_rent"]))
        i.merge!("twenty-three" => (@try[9][16] + i["unit_rent"]))
        i.merge!("twenty-four" => (@try[9][17] + i["unit_rent"]))

      else
        @garbage += 1
      end
    end

    @tree = @reportAvailable[0]["name"]

    #@reportAvailable.each do |i|
      #i.merge!(@try)


    #a = [98.5, 85, 50, 50, 23, 0, 0, 0]
    #sorted = a.sort.uniq
    #a.map!{|e| sorted.index(e) + 1}
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

  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  def report


    file = Tempfile.new('test')
    doc_text = Report.text(@property)
    Prawn::Document.generate(file) do
      text doc_text
    end
    send_file file, :type=>"application/pdf", :x_sendfile=>true
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :unit, :unit_type, :bedroom, :group, :tenantid, :resident_name, :resident_rent, :status, :days_vacant, :move_in, :move_out, :lease_from, :lease_to, :amenities, :company_id)
    end
end
