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

printBoard(theBoard)
