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
     for i in 0...@completed.size
       @completed[i].gsub!(/pending/,'complete')
     end
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

def load_from_file

  text=File.open(@filename).read
  text.each_line do |line|
  line.slice('#')
     if line.include?('pending')
      @pending << line
         else line.include?('complete')
       @completed << line
      end
   end
end

def load1

  text=File.open(@filename).read
  text.each_line do |line|
  line.slice('#')
     if line.include?('pending')
      @pending << line
         else line.include?('complete')
       @completed << line
      end
   end
end


def save(filename)
  f = File.open(filename, "w")
  str = ""
  str = @todo.join("\n")
  if (str == "complete" && str == "pending") then
  return EXIT_FAILURE
  end
  f.write(str)
  f.close
   count = 0
   File.open(filename) {|f| count = f.read.count("")}
   count+1
end

def save_to_file(filename)
  f = File.open(filename, "w")
  str = ""
  str = @todo.join("\n")
    if (str == "complete" && str == "pending") then
    return EXIT_FAILURE
        end
  f.write(str)
  f.close
   count = 0
   File.open(filename) {|f| count = f.read.count("")}
   count+1
   File.delete(filename)
end

end
