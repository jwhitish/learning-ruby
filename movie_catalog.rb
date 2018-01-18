movies = Hash.new
movies["Iron Man"] = 4

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."
choice = gets.chomp.downcase

case choice
  when "add"
    puts "What movie should I add?"
    title = gets.chomp.downcase.to_sym
    if movies[title] == nil
      puts "What is your rating? (0-5)"
      rating = gets.chomp.downcase.to_i
      movies[title] = rating
      puts "Movie and Rating added!"
    else
      puts "Error: Movie already exists!"
    end

  when "update"
    puts "What movie should I update?"
    title = gets.chomp.downcase.to_sym
    if movies[title] == nil
      puts "Error: Movie is not in my records!"
    else
      puts "What is your new rating?"
      rating = gets.chomp.downcase.to_i
      movies[title] = rating
      puts "Rating updated!"
    end

  when "display"
    movies.each do |movie, rating|
      puts "#{movie}: #{rating}"
    end

  when "delete"
    puts "What movie should I remove?"
    title = gets.chomp.downcase.to_sym
    if movies[title] == nil
      puts "Error: Movie is not in my records!"
    else
      movies.delete(title)
      puts "Movie deleted!"
    end

  else
    puts "Error! You didn't pick a valid option."
end
