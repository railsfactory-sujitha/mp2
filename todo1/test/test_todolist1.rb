require_relative '../lib/todolist'
require 'test/unit'



class TestTodo < Test::Unit::TestCase

 def setup

  @t = Todolist.new("todo.txt")
 
 end

 def teardown

  @t=nil
 
 end

def test_empty
 
  @t.empty
  assert_equal 0,@t.pending.size
  assert_equal 0,@t.completed.size
  assert_equal 0,@t.list.size
end

 def test_add
  @t.empty
  @t.add("complete")
  assert_equal 1,@t.pending.size
  assert_equal 0,@t.completed.size
  assert_equal 1,@t.list.size
 end

def test_add2
  @t.empty
  @t.add("one")
  @t.add("two")
  assert_equal 2,@t.pending.size
  assert_equal 0,@t.completed.size
  assert_equal 2,@t.list.size
 end

def test_complete
  @t.empty
  @t.add("one")

  assert_equal 1,@t.pending.size
  assert_equal 0,@t.completed.size
  assert_equal 1,@t.list.size

  @t.complete(1)

  assert_equal 0,@t.pending.size
  assert_equal 1,@t.completed.size
  assert_equal 1,@t.list.size
 end



  def test_delete
   @t.empty
   @t.add("one")
   @t.complete(1)
   
   assert_equal 0,@t.pending.size
   assert_equal 1,@t.completed.size
   assert_equal 1,@t.list.size

   @t.delete(1)

   assert_equal 0,@t.pending.size
   assert_equal 0,@t.completed.size
   assert_equal 0,@t.list.size

  end
 
  

 def test_modify
   @t.empty
   @t.add("one")
   @t.add("two")
   @t.complete(1)

   assert_equal 1,@t.pending.size
   assert_equal 1,@t.completed.size
   assert_equal 2,@t.list.size
   
   @t.modify(1,"three")
  
   assert_equal 1,@t.pending.size
   assert_equal 1,@t.completed.size
   assert_equal 2,@t.list.size
   
  end
 
def test_pending
   @t.empty
   @t.add("one")
   @t.add("two")
  

   assert_equal 2,@t.pending.size
   assert_equal 0,@t.completed.size
   assert_equal 2,@t.list.size
   
   @t.show_pending(2)
     
   assert_equal "two",@t.show_pending(2)
   assert_equal 2,@t.pending.size
   assert_equal 0,@t.completed.size
   assert_equal 2,@t.list.size
   
  end
  
def test_completed
   @t.empty
   @t.add("one")
   @t.add("two")
   @t.complete(1)

   assert_equal 1,@t.pending.size
   assert_equal 1,@t.completed.size
   assert_equal 2,@t.list.size
   
   @t.show_completed(1)
     
   assert_equal "one",@t.show_completed(1)
   assert_equal 1,@t.pending.size
   assert_equal 1,@t.completed.size
   assert_equal 2,@t.list.size
 
end
  
def test_10_save
   @t.empty

   @t.add("item1#pending")
   @t.add("item2#pending")
   @t.add("item3#pending")
  
   
   assert_equal 3,@t.pending.size
   assert_equal 0,@t.completed.size
   assert_equal 3,@t.list.size
   
   @t.save_to_file("a.txt")
    
   assert_equal 3,@t.pending.size
   assert_equal 0,@t.completed.size
   assert_equal 3,@t.list.size
end


def test_load
    #before action
    @t.empty
    assert_equal 0,@t.pending.size
    assert_equal 0,@t.completed.size
    assert_equal 0,@t.list.size
    #action
    @t.load_from_file
    #after action
    assert_equal 5,@t.pending.size
    assert_equal 1,@t.completed.size
    assert_equal 6,@t.list.size
    #set 1 to be complete
    @t.complete(1)
    assert_equal 4,@t.pending.size
    assert_equal 2,@t.completed.size
    assert_equal 6,@t.list.size
    #action
    @t.save("file_suji.txt")
    assert_equal 4,@t.pending.size
    assert_equal 2,@t.completed.size
    assert_equal 6,@t.list.size
end


end
