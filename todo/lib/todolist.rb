class Todolist
attr_accessor :filename,:todo,:pending,:completed


def initialize(filename)
$filename = filename
$todo = []
$pending = []
$completed = []
end

def pending
return $pending.size
end

def list
$todo = $pending + $completed
return $todo.size
end

def completed
return $completed.size
end

def add(item)
$pending << item
return $pending.size
end

def complete(num)
$completed << $pending[num - 1]
$pending.delete_at(num - 1)
return $completed.size
end

def delete(num)
$completed.delete_at(num-1)
return $completed.size
end

def modify(num , item)
$pending[num-1] = item
return $pending[num-1]
end

def empty
$pending.clear
$completed.clear
$todo.clear
return true
end

def show_pending(num)
return $pending[num-1]
end

def show_completed(num)
return $completed[num-1]
end

end


