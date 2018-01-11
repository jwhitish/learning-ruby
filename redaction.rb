#takes string and redacts the output

puts "Enter some text: "
text = gets.chomp
text.downcase!

puts "Enter words to redact: "
redact = gets.chomp
redact.downcase!

words = text.split(" ")
words.each { |word|
  if word == redact
    print "REDACTED "
  else
 		print word + " "
  end }
