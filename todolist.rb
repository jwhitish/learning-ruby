#require IO

module Menu
  def menu
    "Welcome to the ToDoList Program. Please select one of the following options:
    1) Add an item
    2) Show the current list
    3) Update a task
    4) Delete an item
    5) Save current list
    6) Open a saved file
    Q) Quit the program
     "
  end

  def show
    menu
  end
end

module Promptable
  def prompt(message = "What would you like to do?", symbol = ":> ")
    print message
    print symbol
    gets.chomp
  end
end

class List
  attr_reader :all_tasks

  def initialize
    @all_tasks = []
  end

  def add(task)
    all_tasks << task
  end

  def show
    all_tasks.map.with_index { |l, i| "(#{i.next}): #{l}"}
  end

  def delete(task_num)
    all_tasks.delete_at(task_num - 1)
  end

  def write_to_file(filename)
    IO.write(filename, @all_tasks.map(&:to_s).join("\n"))
  end

  def read_from_file(filename)
    IO.readlines(filename).each {|line| add(Task.new(line.chomp))}
  end

  def update(task_num, task)
    all_tasks[task_num - 1] = task
  end
end

class Task
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def to_s
    description
  end
  #alias to_s description #fixed the obj id vs string issue
end


if __FILE__ == $PROGRAM_NAME
  include Menu
  include Promptable
  my_list = List.new
  puts 'Please choose from the following list'
    until ['q'].include?(user_input = prompt(show).downcase)
      case user_input
        when '1'
          my_list.add(Task.new(prompt('What is the task you would like to accomplish?')))
        when '2'
          puts my_list.show
        when '3'
          my_list.update(prompt("What task number should be updated?").to_i, Task.new(prompt("What should the task be updated to?")))
        when '4'
          puts my_list.show
          my_list.delete(prompt("Which item would you like to delete?").to_i)
        when '5'
          my_list.write_to_file(prompt("What should I name the file?"))
        when '6'
          begin
            my_list.read_from_file(prompt("Enter the file name to load from: "))
          rescue Errno::ENOENT
            puts "File name not found, please verify your file name and path."
          end
        else
          puts "Sorry, I didn't get that."
      end
    end
  puts 'Outro - Thanks for using the menu system!'
end
