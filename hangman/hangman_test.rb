word_file = File.open('5desk.txt', 'r') { |file| file.read }
valid_words = word_file.split.select { |word| word.length.between?(5,12) }
word = valid_words[rand(valid_words.size)].scan /\w/

puts "Word: " + word.join



def prompt(message = 'Enter your guess:', symbol = ':> ')
  puts message
  print symbol
  gets.chomp
end

guess = prompt.downcase

indices = []
word.each do |a|
  if a == guess
    #find the index in @word
    indices.push(a)
  else
    indices.push("_")
  end
end
puts indices.join(" ")
