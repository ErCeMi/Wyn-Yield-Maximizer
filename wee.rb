offerings = [["seven", 0], ["eight", 1], ["nine", 2], ["ten", 3],
    ["eleven", 4], ["twelve", 5], ["thirteen", 6], ["fourteen", 7],
     ["fifteen", 8], ["sixteen", 9], ["seventeen", 10], ["eighteen", 11],
      ["nineteen", 12], ["twenty", 13], ["twenty-one", 14],["twenty-two", 15],
       ["twenty-three", 16], ["twenty-four", 17]]

apple = [0,2,4,6]
walrus = []

apple.each do |z|
  walrus << offerings[z]
end

print walrus
