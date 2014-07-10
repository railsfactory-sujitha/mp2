class Todolist
attr_accessor :complete, :pending ,:filename

def initialize
@filename = filename
end

def pending
pending = []
return pending
end

def list
list = []
return list
end
 
def completed
complete = []
return complete
end
 
def add(item)
end

def complete(item)
end

def incomplete(item)
end

def delete(num)
end

def modify(num,item)
end

def show_pending
end

def show_completed
end

def empty
end

private def load
end

private def save
end

end
Todolist.new.list
