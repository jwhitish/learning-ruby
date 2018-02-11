puts "WHAT DID YOU SAY!?"
reply = gets.chomp
while reply != "BYE"
  if reply == reply.upcase
    puts "NO, NOT SINCE #{rand(21) + 1930}!"
    reply = gets.chomp
  else
    puts "HUH!? SPEAK UP SONNY!"
    reply = gets.chomp
  end
end
