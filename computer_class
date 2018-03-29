class Computer
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  @@users = {}

  def create(filename)
    @filename = filename
    time = Time.now
    @files[filename] = time
    puts "New file created: #{filename} at #{time}"
  end

  def Computer.get_users
    return @@users
  end
end

my_computer = Computer.new("jacob", 1234)
