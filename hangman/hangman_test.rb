word_file = File.open('5desk.txt', 'r') { |file| file.read }
valid_words = word_file.split.select { |word| word.length.between?(5,12) }
@word = valid_words[rand(valid_words.size)].scan /\w/
@game_board = []
@word.length.times { @game_board.push("_") }
#puts "__Debug__: game board-" + @game_board.join(" ")


puts "Word: " + @word.join

def prompt(message = 'Enter your guess:', symbol = ':> ')
  puts message
  print symbol
  gets.chomp
end
