# write a method that takes a block
# call block once for each hour
# "DONG!" for each hour

def grandfatherClock &block
  time = Time.now.hour
  if time > 12
    newtime = time / 2
  else
    newtime = time
  end
  newtime.times do
    block.call
  end
end

grandfatherClock do
  puts "DONG!"
end
