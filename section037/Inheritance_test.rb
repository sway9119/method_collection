# クラスの継承
# スーパークラスは一つしか持つことができない。（単一継承）
# 継承して重複を避ける → 差分プログラミング

class Super
  def foo() :foo end
end

class Sub < Super
  def bar() :bar end
end

sub = Sub.new
puts sub.foo  # => foo
puts sub.bar  #=> bar