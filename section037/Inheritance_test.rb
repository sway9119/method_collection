class Super
  def foo() :foo end
end

class Sub < Super
  def bar() :bar end
end

sub = Sub.new
puts sub.foo  # => foo
puts sub.bar  #=> bar