-Class methods defined by self.method_name; alternatively could define as ClassName.method_name
-with no prefix, methods are automatically instance methods

Example:
#uses class var and class method to cound the number of class instances have been created

class Square #new class
  def initialize
    if defined?(@@number_of_squares) #class variable to count instances
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end

  def Square.count #class method to return the number of instances have been created
    @@number_of_squares
  end
end

-Reflection is the process by which a program can inspect, analyze, and modify itself while its running.
-Protected methods make a method private, but within the scope of the class rather than locally to the object

-Polymorphism is the concept of writing code that can work with objects of multiple types and classes at once. ie, the + method works to add numbers, join strings, and add arrays.

-Nested classes, classes defined within another class. Useful for when a class depends on another class that isnt necessarily useful anywhere else. To access nested class from outside the parent class you use ::
ie
class Drawing
  class line
  end
end

a = Drawing::line.new
