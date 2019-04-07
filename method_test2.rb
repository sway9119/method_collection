class Super 
  def func1()
    "Super#func1" 
  end
end

class Sub < Super
  def func2()
    "Sub#func2"
  end

  def run
    puts self  # => #<Sub:0x00007f9a6413feb0>

    # Sub1#func1がないので、Super#func1にを探して表示している
    puts func1  # => Super#func1
    
    # class内にfunc2があるのでそれを呼び出している
    puts func2  # => Sub#func2
    "Sub#run"
  end
end

puts Sub.new.run  # => "Sub#run"