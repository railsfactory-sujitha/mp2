require_relative '../lib/todolist'
require 'test/unit'

class Test_todolist < Test::Unit::TestCase

$t = Todolist.new("file_suji.txt")
def test_1empty

assert_equal true, $t.empty
assert_equal 0, $t.pending
assert_equal 0, $t.list
assert_equal 0, $t.completed
end

def test_2add1

assert_equal 1, $t.add("item1")
assert_equal 1, $t.pending
assert_equal 1, $t.list
assert_equal 0, $t.completed
end

def test_3add2

assert_equal 2, $t.add("item2")
assert_equal 2, $t.pending
assert_equal 2, $t.list
assert_equal 0, $t.completed
end
def test_4add3

assert_equal 3, $t.add("item3")
assert_equal 3, $t.pending
assert_equal 3, $t.list
assert_equal 0, $t.completed
end
def test_5add4

assert_equal 4, $t.add("item4")
assert_equal 4, $t.pending
assert_equal 4, $t.list
assert_equal 0, $t.completed
end

def test_6complete

assert_equal 1, $t.complete(1)
assert_equal 3, $t.pending
assert_equal 4, $t.list

end
def test_7delete

assert_equal 0, $t.delete(1)
assert_equal 3, $t.pending
assert_equal 3, $t.list
assert_equal 0, $t.completed
end
def test_8modify

assert_equal "item2_modify", $t.modify(2,"item2_modify")
assert_equal "item1_modify", $t.modify(1,"item1_modify")
assert_equal 0, $t.completed
assert_equal 3, $t.pending
assert_equal 3, $t.list
end
def test_9show_pending

assert_equal "item2_modify", $t.show_pending(2)
end

def test_10show_completed

assert_equal nil, $t.show_completed(1)
end


end
