#converting a symbol to a proc

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

strings_array = numbers_array.map(&:to_s)

puts strings_array


#convert strings to symbol

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]

symbolize = lambda {|param| param.to_sym}

symbols = strings.collect(&symbolize)
print symbols


#lambda vs proc

#proc returns immediately w/o going back to method
def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc


#lambda goes back to method after being called so returns the last code it evaluates

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda
