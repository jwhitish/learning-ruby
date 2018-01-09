print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!

print "What is your last name? "
last_name = gets.chomp
last_name.capitalize!

print "What city are you from? "
city = gets.chomp
city.capitalize!

print "What state are you from? (Initials) "
state = gets.chomp
state.upcase!

print "Your name is #{first_name} #{last_name} and you are from #{city}, #{state}"
