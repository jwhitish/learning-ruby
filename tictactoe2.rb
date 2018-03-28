#!/usr/bin/env ruby

# check for victory in a game loop

theBoard = Hash.new(" ")
theBoard["topL"] = " "
theBoard["topM"] = " "
theBoard["topR"] = " "
theBoard["midL"] = " "
theBoard["midM"] = " "
theBoard["midR"] = " "
theBoard["lowL"] = " "
theBoard["lowM"] = " "
theBoard["lowR"] = " "

def printBoard(theBoard)
  puts theBoard["topL"] + "|" + theBoard["topM"] + "|" + theBoard["topR"]
  puts "-+-+-"
  puts theBoard["midL"] + "|" + theBoard["midM"] + "|" + theBoard["midR"]
  puts "-+-+-"
  puts theBoard["lowL"] + "|" + theBoard["lowM"] + "|" + theBoard["lowR"]
end

#add vertical columns
def winner?
  if theBoard["topL"] == O && theBoard["topM"] == O && theBoard["topR"] == O
    return true
  elsif theBoard["midL"] == O && theBoard["midM"] == O && theBoard["midR"] == O
    return true
  elsif theBoard["lowL"] == O && theBoard["lowM"] == O && theBoard["lowR"] == O
    return true
  elsif theBoard["topL"] == O && theBoard["midM"] == O && theBoard["lowR"] == O
    return true
  elsif theBoard["lowL"] == O && theBoard["midM"] == O && theBoard["topR"] == O
    return true
  elsif theBoard["topL"] == X && theBoard["topM"] == X && theBoard["topR"] == X
    return true
  elsif theBoard["midL"] == X && theBoard["midM"] == X && theBoard["midR"] == X
    return true
  elsif theBoard["lowL"] == X && theBoard["lowM"] == X && theBoard["lowR"] == X
    return true
  elsif theBoard["topL"] == X && theBoard["midM"] == X && theBoard["lowR"] == X
    return true
  elsif theBoard["lowL"] == X && theBoard["midM"] == X && theBoard["topR"] == X
    return true
  else
    return false
end



puts "Welcome to Tic Tac Toe! Spaces are labeled as follows: "
puts "topL, topM, topR"
sleep(0.5)
puts "midL, midM, midR"
sleep(0.5)
puts "lowL, lowM, and lowR."
sleep(0.5)
puts "Ready? Let's play!"
sleep(1)

turn = "X"
@count = 0
(0..8).each { |i|
  printBoard(theBoard)
  if victory?
    puts "#{turn} wins!"
    break
  else
    puts "Turn for #{turn}. Move on which space? "
    move = gets.chomp
    theBoard[move] = turn
    if turn == "X"
      turn = "O"
    else
      turn = "X"
    end
    @count += 1
  end
}
