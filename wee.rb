array = [1,2,3,4]
array.map!{|x|x == 4 ? 'Z' : x}

puts array
