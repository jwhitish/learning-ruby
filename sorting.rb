#uses sort method on array

my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]

my_array.sort!

puts my_array


#combined comparison operator example
#returns 1 since second item comes before first

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

print book_1 <=> book_2


#sorting an array in ascending or descending order using
#the .sort method
#.sort accepts an optional block to manually specify order

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below

books.sort! { |firstBook, secondBook| secondBook <=> firstBook }
