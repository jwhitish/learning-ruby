#working with PStore and marshalling to save objects to disk

class Person
  attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23

#stores the person objects to a disk-based hash
require 'pstore'
store = PStore.new("storagefile")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << laura
end

#retrieve the person objects
require 'pstore'
store = PStore.new("storagefile")
people = []
store.transaction do
  people = store[:people]
end

#people can now be treated as local objects

people.each do |person|
  puts person.name
end
