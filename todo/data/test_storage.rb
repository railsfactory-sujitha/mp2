require_relative '../data/lib/storage'
require 'test/unit'



class Test_Storage < Test::Unit::TestCase

  def test_hello
    	assert true
   end
def test_store
assert_not_nil("file.txt",msg = 'not empty')
assert_equal "hi",Storage.dump("hi")
assert_equal "task",Storage.dump("task")
assert_equal "task2",Storage.dump("task2")
end
end
