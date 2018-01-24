#creating a new class

class Person
  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
  end
end

matz = Person.new("Yukihiro")
