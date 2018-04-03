#simple log file to demonstrate IO

f = File.new("logfile.txt", "a")
f.puts Time.now
f.close
