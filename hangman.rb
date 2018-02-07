
#load the 5desk.txt dictionary
word_file = File.open('5desk.txt', 'r') { |file| file.read }

#select a random word between 5-12 char long
valid_words = word_file.split.select { |word| word.length.between?(5,12) }

word = valid_words[rand(valid_words.size)].downcase.split(' ')

guesses = word.length

puts word.class
puts "You have #{guesses} guesses left."

#display guess count, letters already chosen, position in word (H_ll_), and incorrect letters already chosen
#every turn guess char, make it case insensitive, update display to reflect whether the letter was correct, if out of guesses player should lose
#at start of turn give player option to save game or guess letter
#when program first loads give option to open saved game
