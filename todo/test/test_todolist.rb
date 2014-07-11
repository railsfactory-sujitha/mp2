require_relative '../lib/todolist'

require 'test/unit'


class Test_todolist < Test::Unit::TestCase

def test_empty
assert_equal true, Todolist.empty
assert_equal 0, Todolist.pending
assert_equal 0, Todolist.list
assert_equal 0, Todolist.completed
end

def test_add1
assert_equal 1, Todolist.add("item1")
assert_equal 1, Todolist.pending
assert_equal 1, Todolist.list
assert_equal 0, Todolist.completed
end
def test_add2
assert_equal 2, Todolist.add("item2")
assert_equal 2, Todolist.pending
assert_equal 2, Todolist.list
assert_equal 0, Todolist.completed
end
def test_add3
assert_equal 3, Todolist.add("item3")
assert_equal 3, Todolist.pending
assert_equal 3, Todolist.list
assert_equal 0, Todolist.completed
end
def test_add4
assert_equal 4, Todolist.add("item4")
assert_equal 4, Todolist.pending
assert_equal 4, Todolist.list
assert_equal 0, Todolist.completed
end

def test_complete
assert_equal 1, Todolist.complete(1)
assert_equal 3, Todolist.pending
assert_equal 4, Todolist.list

end
def test_delete
assert_equal 0, Todolist.delete(1)
assert_equal 3, Todolist.pending
assert_equal 3, Todolist.list
assert_equal 0, Todolist.completed
end
def test_modify
assert_equal "item2_modify", Todolist.modify(2,"item2_modify")
assert_equal "item1_modify", Todolist.modify(1,"item1_modify")
assert_equal 0, Todolist.completed
assert_equal 2, Todolist.pending
assert_equal 2, Todolist.list
end
def test_show_pending
assert_equal "item2_modify", Todolist.show_pending(2)
end
def test_show_completed
assert_equal nil, Todolist.show_completed(1)
end

end
