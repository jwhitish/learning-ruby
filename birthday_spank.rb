puts "What year were you born in?"
year = gets.chomp.to_i
puts "What month were you born in? (number only)"
month = gets.chomp.to_i
puts "What day were you born on? (number only)"
day = gets.chomp.to_i

birthday = Time.mktime(year,month,day)
puts "Your birthday is #{birthday}."

today = Time.new
diff = today - birthday
spanks = diff.to_i / 31536000
puts "You get #{spanks} birthday spanks!"
spank = "SPANK! "
puts spank * spanks
