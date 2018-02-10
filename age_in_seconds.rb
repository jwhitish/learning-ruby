

def user_age
  puts "How old are you in years?"
  age = gets.chomp
  puts "You are #{age} years old"
  seconds = age.to_i * 365 * 24 * 60 * 60
  puts "You are #{seconds} seconds old."
end

user_age
