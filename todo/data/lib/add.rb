require_relative 'storage'

class Add

def self.add(item)

#to add an item
#a = ['pending','completed']
item = gets.chomp
#item = item + a[rand(a.size)]
 puts "#{item}"
item.Storage.dump(item)
file = File.open("file.txt",'r')
	data = file.read
 	file.close
        return data.strip
end   

end

