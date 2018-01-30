#!/usr/bin/env ruby

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
(0..8).each { |i|
  printBoard(theBoard)
  puts "Turn for #{turn}. Move on which space? "
  move = gets.chomp
  theBoard[move] = turn
  if turn == "X"
    turn = "O"
  else
    turn = "X"
  end
}
