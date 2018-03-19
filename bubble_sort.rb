arry = [4,3,78,2,0,2]

def bubble_sort(array)
  #compare two elements
  #if left is bigger than right, swap places
  #do this until no swaps needed
  sorted = false
  swaps = 0

  while sorted == false
    array.each_index do |index|
      if index < (array.length - 1)
        if array[index] > array[index + 1]
          array[index], array[index + 1] = array[index + 1], array[index]
          swaps += 1
        end
      else
        sorted = true if swaps == 0
        swaps = 0 #reset for next iteration
      end
    end
  end
  puts array.join(",")
end

#bubble_sort(arry)

def bubble_sort_by(array)
  sorted = false
  swaps = 0

  while sorted == false
    array.each_index do |index|
      if index < (array.length - 1)
        if yield(array[index], array[index + 1]) > 0
          array[index], array[index + 1] = array[index + 1], array[index]
          swaps += 1
        end
      else
        sorted = true if swaps == 0
        swaps = 0
      end
    end
  end
  puts array.join(",")
end


bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end
#answer ["hi", "hey", "hello"]
