require 'item'
require 'storage'
load '/home/manjusagar/Desktop/todo/data/file.txt'

class Todo_list

def initialize(item,status)
@item = item
@status = status
end

def add
#to add an item
@item = @item.to_a.push item
a = ['pending','completed']
item = item + a[rand(a.size)]
file = File.new("file.txt", 'r')
  while (line = file.gets)
    line.chomp 
    list = line.split(/\n/)
    puts "#{list}"
  end
end

def status
#to check whether it is pending or not


end

def delete
#to delete an item from the todo_list
end

def list(item)
#to list the item from storage
 i=0
   f=File.open("file.txt",'r') do |f|
   while line=f.gets 
   i=i+1
   puts "#{i}"+':'+line

end
end
todo = Todo_list.new
puts "Enter item to be added"
todo.add
todo.list
