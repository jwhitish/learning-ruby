#sum of all multiples of 3 or 5 below 1000

num = 0
array = []

while num < 1000
  if num % 3 == 0 || num % 5 == 0
    array.push num
  end
  num += 1
end

sum = 0

array.each {|item| sum += item}

puts sum
