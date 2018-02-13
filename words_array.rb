#type as many words as you want, one per line, until hit enter on an empty line which then repeats words back in apha order

puts "Type as many words as you want, one per line. When you are done, hit enter on an empty line and I will repeat the words back to you in alphabetical order."

word = nil
list = []

while word != ""
  word = gets.chomp
  list.push word
end

puts list.sort
