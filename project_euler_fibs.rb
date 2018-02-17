#sum of all even valued fibonacci sequence numbers below 4 million

n = 1
numSet = [0,0]
sum = -1

while n < 4000000
  n = n + numSet[-2]
  numSet.push n
end

puts numSet

numSet.each {|n| sum += n}
puts sum
