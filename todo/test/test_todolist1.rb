require_relative '../lib/todolist'
require 'test/unit'

class Test_todolist < Test::Unit::TestCase

def setup

@t = Todolist.new("file_suji.txt")

end

def teardown
@t = nil
end

def test_empty

@t.empty
assert_equal 0, @t.pending.size
assert_equal 0, @t.list.size
assert_equal 0, @t.completed.size
end

def test_add

@t.add("item1")
assert_equal 1, @t.pending.size
assert_equal 1, @t.list.size
assert_equal 0, @t.completed.size
end

 def test_complete
# precondition
@t.empty
@t.add("one")
#before state
assert_equal 1,@t.pending.size
assert_equal 0,@t.completed.size
assert_equal 1,@t.list.size


#action
   @t.complete(1)

#after 
assert_equal 0,@t.pending.size
assert_equal 1,@t.completed.size
assert_equal 1,@t.list.size
end

def test_delete
#precondition
@t.empty
@t.add("item2")
#before state
assert_equal 1,@t.pending.size
assert_equal 0,@t.completed.size
assert_equal 1,@t.list.size
#action
   @t.complete(1)
assert_equal 0,@t.pending.size
assert_equal 1,@t.completed.size
assert_equal 1,@t.list.size
 @t.delete(1)
#after state
assert_equal 0,@t.pending.size
assert_equal 0,@t.completed.size
assert_equal 0,@t.list.size
end


def test_modify
#precondition
@t.empty
@t.add("item3")
#before state
assert_equal 1,@t.pending.size
assert_equal 0,@t.completed.size
assert_equal 1,@t.list.size
#action
@t.modify(1,"item2_modify")
#after state
assert_equal 1,@t.pending.size
assert_equal 0,@t.completed.size
assert_equal 1,@t.list.size
end


def test_show_pending

assert_equal "item2_modify", @t.show_pending(1)
end

def test_show_completed

assert_equal nil, @t.show_completed(1)
end


end

