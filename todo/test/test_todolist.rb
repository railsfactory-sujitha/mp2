require_relative '../lib/todolist'
require 'test/unit'

class Test_todolist < Test::Unit::TestCase

def test_empty
assert_equal 0,Todolist.new.list.size
assert_equal 0,Todolist.new.pending.size
assert_equal 0,Todolist.new.completed.size
end

end
