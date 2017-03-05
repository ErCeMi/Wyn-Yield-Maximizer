@array_of_rankings_per_bedroom_per_prop = []
@number_of_properties = 4

(@number_of_properties * 3).times do
  @array_of_rankings_per_bedroom_per_prop << [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]

  end

@array_of_lease_terms_at_indeces = [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
@array_of_lease_terms_to_display = [8,10,14,17,18,24]
@array_of_indeces_for_ranking = []
@array_of_lease_terms_to_display.each do |r|
    @array_of_indeces_for_ranking << @array_of_lease_terms_at_indeces.index(r)
 end

 # print @array_of_indeces_for_ranking

 @alpha = []
 @garbage = 0

# [1, 3, 7, 10, 11, 17]
  #  s
  #print @thingy
  #print
  # @alpha.each do |i|
  #   z = i.sort.uniq
  #   i.map! do |b|
  #     (z.index(b) + 1)
  #   end
# end
#

  # (0..((@number_of_properties * 3) - 1)).each do |a|
  #   @array_of_rankings_per_bedroom_per_prop[a].map! {|x| @array_of_indeces_for_ranking.include?(@array_of_rankings_per_bedroom_per_prop[a].index(x)) ? 5 : nil }
  # end
  #
#print @array_of_rankings_per_bedroom_per_prop
#print "\n"
# print @array_of_rankings_per_bedroom_per_prop
# print "\n"
  (0..((@number_of_properties * 3) - 1)).each do |a|
    @array_of_rankings_per_bedroom_per_prop[a].each_with_index do |b,c|
      if @array_of_indeces_for_ranking.index(c)
          @garbage +=1
      else
        @array_of_rankings_per_bedroom_per_prop[a] -= [@array_of_rankings_per_bedroom_per_prop[a][c]]
      end
    end
  end
#print @array_of_rankings_per_bedroom_per_prop

  # z = [0,1,2,3]  #indeces
  # t = [1,2,3,4,5,6]
  # t.each_with_index do |b, c|
  #   if z.index(c)
  #     @garbage += 1
  #   else
  #     t -= [t[c]]
  #   end
  # end



  #   if z.index(0)
  #     @garbage += 1
  #   else
  #     t -= [t[0]]
  #   end
  #
  #
  #   if z.index(1)
  #     @garbage += 1
  #   else
  #     t -= [t[1]]
  #   end
  #
  #
  #   if z.index(2)
  #     @garbage += 1
  #   else
  #     t -= [t[2]]
  #   end
  #
  #
  #   if z.index(3)
  #     @garbage += 1
  #   else
  #     t -= [t[3]]
  #   end
  #
  #
  #   if z.index(4)
  #     @garbage += 1
  #   else
  #     t -= [t[4]]
  #   end
  #
  #   if z.index(5)
  #     @garbage += 1
  #   else
  #     t -= [t[5]]
  #   end
  #
  #   if z.index(6)
  #     @garbage += 1
  #   else
  #     t -= [t[6]]
  #   end
  #
  #
  # print t






# iterate over array "t" if number's INDEX matches item in array "z", then do NOTHING
# If it DOES not, delete item in "t" at that index
  z = [1,2,4,5]
  t = [1,2,3,4,5,6,7,8,9,10,11]
  test = []
  z.each do |a|
    test << t[a]
  end

  print test



# #expecting [2,3,5,6]


#   print t
#   print "\n"
#     t.each_with_index do |a, b|
#        if z.include?(b)
#            @garbage
#         else
#           puts "#{b}is the index"
#           t.delete_at(b)
#           puts "#{t}is new array after deletion"
#           puts 'end one interation'
#         end
#       end

#       print t
#      #
#     #  z.include?(0) ? @garbage += 1 : t -= [t[0]]
#     #  print t
#     #  z.include?(1) ? @garbage += 1 : t -= [t[1]]
#     #  print t
#     #  z.include?(2) ? @garbage += 1 : t -= [t[2]]
#     #  print t
#     #  z.include?(3) ? @garbage += 1 : t -= [t[3]]
#     #  print t
#     #  z.include?(4) ? @garbage += 1 : t -= [t[4]]
#     #  print t
#     #  z.include?(5) ? @garbage += 1 : t -= [t[5]]
#     #  print t
#     #  z.include?(6) ? @garbage += 1 : t -= [t[6]]
#     #  print t
#     #  z.include?(7) ? @garbage += 1 : t -= [t[7]]
#     #  print t
#     #  z.include?(8) ? @garbage += 1 : t -= [t[8]]
#     #  print t
#     #  z.include?(9) ? @garbage += 1 : t -= [t[9]]
#     #  print t
#     #  z.include?(10) ? @garbage += 1 : t -= [t[10]]
#     #  print t
#     # a = [1,2,3]
#     # a.delete_at(1)
#     # print a
#
#
#
#
#   #  t.each_with_index do |a, b|
#   #    if z.index(b)
#   #      puts "true"
#   #    else
#   #      puts "false"
#   #    end
#   #  end
