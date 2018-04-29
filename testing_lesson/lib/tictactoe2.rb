#!/usr/bin/env ruby

@theBoard = Hash.new(" ")
@theBoard["topL"] = " "
@theBoard["topM"] = " "
@theBoard["topR"] = " "
@theBoard["midL"] = " "
@theBoard["midM"] = " "
@theBoard["midR"] = " "
@theBoard["lowL"] = " "
@theBoard["lowM"] = " "
@theBoard["lowR"] = " "

def printBoard(theBoard)
  puts @theBoard["topL"] + "|" + @theBoard["topM"] + "|" + @theBoard["topR"]
  puts "-+-+-"
  puts @theBoard["midL"] + "|" + @theBoard["midM"] + "|" + @theBoard["midR"]
  puts "-+-+-"
  puts @theBoard["lowL"] + "|" + @theBoard["lowM"] + "|" + @theBoard["lowR"]
end

def victory?
  if @theBoard["topL"] == "O" && @theBoard["topM"] == "O" && @theBoard["topR"] == "O"
    return true
  elsif @theBoard["midL"] == "O" && @theBoard["midM"] == "O" && @theBoard["midR"] == "O"
    return true
  elsif @theBoard["lowL"] == "O" && @theBoard["lowM"] == "O" && @theBoard["lowR"] == "O"
    return true
  elsif @theBoard["topL"] == "O" && @theBoard["midM"] == "O" && @theBoard["lowR"] == "O"
    return true
  elsif @theBoard["lowL"] == "O" && @theBoard["midM"] == "O" && @theBoard["topR"] == "O"
    return true
  elsif @theBoard["topL"] == "O" && @theBoard["midL"] == "O" && @theBoard["lowL"] == "O"
    return true
  elsif @theBoard["topM"] == "O" && @theBoard["midM"] == "O" && @theBoard["lowM"] == "O"
    return true
  elsif @theBoard["topR"] == "O" && @theBoard["midR"] == "O" && @theBoard["lowR"] == "O"
    return true
  elsif @theBoard["topL"] == "X" && @theBoard["midL"] == "X" && @theBoard["lowL"] == "X"
    return true
  elsif @theBoard["topM"] == "X" && @theBoard["midM"] == "X" && @theBoard["lowM"] == "X"
    return true
  elsif @theBoard["topR"] == "X" && @theBoard["midR"] == "X" && @theBoard["lowR"] == "X"
    return true
  elsif @theBoard["topL"] == "X" && @theBoard["topM"] == "X" && @theBoard["topR"] == "X"
    return true
  elsif @theBoard["midL"] == "X" && @theBoard["midM"] == "X" && @theBoard["midR"] == "X"
    return true
  elsif @theBoard["lowL"] == "X" && @theBoard["lowM"] == "X" && @theBoard["lowR"] == "X"
    return true
  elsif @theBoard["topL"] == "X" && @theBoard["midM"] == "X" && @theBoard["lowR"] == "X"
    return true
  elsif @theBoard["lowL"] == "X" && @theBoard["midM"] == "X" && @theBoard["topR"] == "X"
    return true
  else
    return false
  end
end


puts "Welcome to Tic Tac Toe! \nPress 'q' to exit the game. \nSpaces are labeled as follows: "
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
  printBoard(@theBoard)
  if victory?
    if turn == "X" #turns flip once a move is made
      puts "O wins!"
      break
    else
      puts "X wins!"
      break
    end
  else
    puts "Turn for #{turn}. Move on which space? "
    move = gets.chomp
    if move.include?("q")
      break
    else
      @theBoard[move] = turn
      if turn == "X"
        turn = "O"
      else
        turn = "X"
      end
      @count += 1
    end
  end
}
