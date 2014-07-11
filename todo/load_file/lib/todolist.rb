class Todolist

def initialize(filename)
@filename = filename
@todo = []
@pending = []
@completed = []
end

def pending
 @pending
end

def list
@todo = @pending + @completed
 @todo
end

def completed
 @completed
end

def add(item)
@pending << item
end

def complete(num)
@completed << @pending[num - 1]
@pending.delete_at(num - 1)
return @completed.size
end

def delete(num)
@completed.delete_at(num-1)
return @completed.size
end

def modify(num , item)
@pending[num-1] = item
return @pending[num-1]
end

def empty
@pending.clear
@completed.clear
@todo.clear
return true
end

def show_pending(num)
return @pending[num-1]
end

def show_completed(num)
return @completed[num-1]
end

def load_file

text=File.open('file_suji.txt').read
text.each_line do |line|
line.split(' #')
if line.include?('pending')
@pending << line
else
@completed << line
end
end
end

end


