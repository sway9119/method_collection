class InstanceMethodExample
  def double(x) x*2 end
  def quadruple(x) double(double(x))  end
  def show_self() self end
end

obj = InstanceMethodExample.new

#puts obj.double(2)  # => 4
#puts obj.quadruple(2)  # => 8
#puts obj.show_self() # => #<InstanceMethodExample:0x00007fb74e878388>




# インスタンスを生成せずにクラスのメソッドを呼び出すには、.selfをメソッド名につける必要がある
# 1.メソッドはレシーバが必須である。
# 2.obj.double(2)のレシーバは、obj(クラスのインスタンス)である。
# 3.ClassMethodExample.double(2)のレシーバは、ClassMethodExample（クラス）である。
# 4.レシーバが、クラスのインスタンスの場合、OK
# 5.レシーバが、クラスの場合、NG　undefined method `double' for ClassMethodExample:Class (NoMethodError)
# 6.クラス内のメソッドは、インスタンスのためのインスタンスメソッドである。
puts obj.class  # => InstanceMethodExample
puts InstanceMethodExample.class  # => Class

#puts obj.superclass  # => undefined method `superclass' for #<InstanceMethodExample:0x00007fdb5b0ff800> (NoMethodError)
puts InstanceMethodExample.superclass  # => Object

puts obj.itself # => #<InstanceMethodExample:0x00007fee9583f618>
puts InstanceMethodExample.itself  # => InstanceMethodExample
# もしかしたら、クラス（概念）で定義したメソッド（振る舞い）はインスタンス（例、事実、生み出されし実体）が実体の時に使える？
# クラス自身をレシーバとするものを特異メソッドと呼ぶ？<->インスタンスメソッド（実体メソッド）
# ex) たい焼きの焼型（クラス）に"アンコ"はないが、たい焼きの実体（インスタンス）に"アンコ"はある
#     その場合、たい焼きの焼型で、"たい焼きは、アンコがある振る舞いを持っている"と設計している。
#     クラス自身がメソッドを行う場合、.selfで実体化して、振る舞う？なんかしっくりこない...

class ClassMethodExample
  def self.double(x) x*2 end
  def self.quadruple(x) double(double(x))  end
  def self.show_self() self end
end

puts ClassMethodExample.double(2)  # => 4
puts ClassMethodExample.quadruple(2)  # => 8
puts ClassMethodExample.show_self() # => ClassMethodExample



# インスタンスメソッドからクラスメソッドを呼び出す場合は、「self.class.クラスメソッド」で呼べる。
# クラスメソッドを呼び出すには、「Object#class」でクラスを求める（ただし「class」は予約語なので「self.class」とする必要がある）
# 1.call_class_method() レシーバはインスタンス
# 2.self.class.class_method　レシーバはクラスメソッド（.selfとってそのまま呼べばいいのに=>他の）
# 3.self.class_method()
# 4.:class_method

class ClassMethodFromInstance
  def self.class_method() :class_method end
  def call_class_method() self.class.class_method end  
end

obj = ClassMethodFromInstance.new 
puts obj.call_class_method  # => class_method
puts obj.class  # => ClassMethodFromInstance


# レシーバがインスタンスなら、インスタンスメソッド（call_instance_method）からインスタンスメソッド（instance_method）を呼べる。普通に。
class TestMethodFromInstance
  def instance_method() :instance_method end
  def call_instance_method() instance_method end  
end

obj = TestMethodFromInstance.new 
puts obj.call_instance_method  # => instance_method
