def display_games
  puts "Current saved games: "
  files = Dir.entries("../saved_games")
  puts files[2..files.length].join(" | ")
end

display_games
