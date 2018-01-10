print "What is your statement? "
user_input = gets.chomp
user_input.downcase!

if user_input.include?"s"
  user_input.gsub!(/s/,"th")
  puts "#{user_input}"
else
  print "No 's' here!"
end
