arry = [4,3,78,2,0,2]

def bubble_sort(array)
  #compare two elements
  #if left is bigger than right, swap places
  #do this until no swaps needed
  sorted = false
  while sorted == false
    array.each_index do |index|
      if index < (array.length - 1)
        if array[index] > array[index + 1]
          array[index], array[index + 1] = array[index + 1], array[index]
        end
      else
        #cheater proof, uses .sort
        if array == array.sort
          sorted = true
        end
      end
    end
  end
  puts array.join(",")
end

bubble_sort(arry)
