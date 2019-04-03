# class名は大文字始まり出ないと認識されない。
class Foo
end

# Fooくらすは定数Fooに代入されている
puts Foo  # => Foo
puts defined? Foo  # => "constant"

# Fooはクラスオブジェクト
puts Foo.class  # => class

# スーパークラスはObject
puts Foo.superclass  # => Object

class Bar < Foo  # Fooを継承
end

puts Bar.superclass  # => Foo

class Baz
  # attr_accessorはModuleクラスのメソッドなので呼び出せる
  # → classクラスはModuleクラスを継承している。（Class<Modue<Object）
  attr_accessor :attrib
  # 任意の式を記述できる
  puts 1+2  # => 3
  
  def self.a_class_method() :class_method end
  
  # クラスメソッド定義直後に呼び出せる
  puts a_class_method  # => class_method
end

# method bodydyでは、classの定義ができない。
# => class definition in method body
# def f
#   class X end
# end

# class定義外のローカル変数は見えない
# => `<class:Example>': undefined local variable or method `lvar' for Example:Class (NameError)
# lvar = 1
# class Example
#   lvar
# end

# moduleは、インスタンスを生成できないクラスのようなもの。
# 主にMix-inや名前空間分離のために使用される。
module M
  #メソッド定義、クラス定義、モジュール定義などの式
end
