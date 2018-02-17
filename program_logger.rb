
def log description, &block
  puts "Starting "+description+" block!"
  result = block.call
  puts "Finished "+description+" block! Returning: "+result.to_s
end

log "first one" do
  puts "this is overwritten"
  log "second one" do
    puts "this one isnt"
  end
end
