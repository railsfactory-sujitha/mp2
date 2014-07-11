require 'storage'
class Status

def self.status
#to check the status
Storage.dump(item)
item.include?('pending')
end

end
