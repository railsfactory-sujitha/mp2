class Storage

def self.dump(item)
	f1 = File.open("file.txt", "w") 
	#a = ['pending','completed']
	#item = item + a[rand(a.size)]
	f1.puts(item)
	f1.close
	f2 = File.open("file.txt", "r")
	data1 = f2.read
	f2.close
	return data1.strip

end

def self.get
	data = ""
	file = File.open("file.txt",'r')
	data = file.read
 	file.close
        return data.strip
end


end
