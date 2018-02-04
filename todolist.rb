
#list class
class List
  attr_reader :all_tasks
  def initialize
    @all_tasks = []
  end
  #method create a list
  #method add a task to a list
  def add(task)
    all_tasks << task
  end
  #method show all tasks
  #method read a task from a file
  #method write a list to a file
  #method delete a task
  #method update a task
end

#task class
class Task
  attr_reader :description
  def initialize(description)
    @description = description
  end
  #method create a task item
end

if __FILE__ == $PROGRAM_NAME
       my_list = List.new
       puts 'You have created a new list'
       my_list.add(Task.new('Make Breakfast'))
       puts 'You have added a task to the Todo List'
end
