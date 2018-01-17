#sample using symbols in hash rocket style
symbol_hash = {
  :one => 1,
  :two => 2,    # Fill in these two blanks!
  :three => 3,


#sample using symbols in new 1.9 hash style
symbol_hash = {
  one: 1,
  two: 2,    # Fill in these two blanks!
  three: 3,



#convert string to symbol
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []

strings.each do |s|
 symbols.push(s.to_sym)
end
print symbols
