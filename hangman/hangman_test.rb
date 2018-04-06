word_file = File.open('5desk.txt', 'r') { |file| file.read }
valid_words = word_file.split.select { |word| word.length.between?(5,12) }
@word = valid_words[rand(valid_words.size)].scan /\w/
@game_board = []
@word.length.times { @game_board.push("_") }
puts "__Debug__: game board-" + @game_board.join(" ")


puts "Word: " + @word.join

def prompt(message = 'Enter your guess:', symbol = ':> ')
  puts message
  print symbol
  gets.chomp
end

@guess = prompt.downcase

already_guessed = []
puts "Letters already guessed: " + already_guessed.join(",")
puts "Word: " + @game_board.join(" ")
@guess = prompt.downcase
if @word.include?(@guess)
  index = 0
  @word.each do |letter|
    if letter == @guess
      @game_board[index] = letter
      index += 1
    end
  end
else
  already_guessed.push(@guess)
end
puts "__Debug__: " + @game_board.join(" ")
puts "__Debug__: " + already_guessed.join(" ")

@guesses -= 1
