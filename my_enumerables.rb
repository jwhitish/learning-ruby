
def my_each
  for item in self do
    yield(item)
  end
end

test = [1,2,3,4]

test.each do |element|
  puts element
end
