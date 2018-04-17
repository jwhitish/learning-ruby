#takes a target value and returns the node at which it is located

def depth_first_search(target, currentNode)
  stack = []
  if currentNode.value == target
    puts "Found target (#{target}) at node: #{currentNode}"
    return currentNode
  else #if not
    if currentNode.right != nil
      stack << currentNode.right
    end
    if currentNode.left != nil
      currentNode = currentNode.left
      depth_first_search(target, currentNode)
    else
      currentNode = stack[-1]
      stack.pop
      depth_first_search(target, currentNode)
    end
  end
end



def depth_first_search(target, currentNode)
  if currentNode.value == target
    puts "\nFound target (#{target}) at node: #{currentNode}\n\n"
    return currentNode
  else #if not
    if currentNode.left != nil
      depth_first_search(target, currentNode.left)
    end
    if currentNode.right != nil
      depth_first_search(target, currentNode.right)
    end
  end
  puts "Target not found."
  return nil
end
