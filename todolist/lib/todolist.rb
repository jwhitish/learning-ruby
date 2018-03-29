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
    7) Toggle the status
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
    machinified = @all_tasks.map(&:to_machine).join("\n")
    IO.write(filename, machinified)
  end

  def read_from_file(filename)
    IO.readlines(filename).each {|line|
      status, *description = line.split(':')
      status = status.include?('X')
      add(Task.new(description.join(':').strip, status))
    }
  end

  def update(task_num, task)
    all_tasks[task_num - 1] = task
  end

  def toggle(task_num)
    all_tasks[task_num - 1].toggle_status
  end
end

class Task
  attr_reader :description
  attr_accessor :status

  def initialize(description, status = false)
    @description = description
    @status = status
  end

  def completed?
    status
  ends

  def to_s
    description
  end

  def to_machine
    "#{represent_status}:#{description}"
  end

  def toggle_status
    @completed_status = !completed?
  end

  private
  def represent_status
    if Task.completed? == false
      puts "[ ]"
    else
      puts "[X]"
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  include Menu
  include Promptable
  my_list = List.new
  puts 'Please choose from the following list'
    until ['q'].include?(user_input = prompt(my_list.show).downcase)
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
        when '7'
          puts my_list.show
          my_list.toggle(prompt("Enter list number to toggle status").to_i)
        else
          puts "Sorry, I didn't get that."
      end
    end
  puts 'Outro - Thanks for using the menu system!'
end
end
