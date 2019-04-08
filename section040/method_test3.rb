# スーパークラスの特異メソッドも呼び出せる。
# ファイルの読み込みのreadはFileのメソッドではなく、IOのメソッド。

# p File.ancestors # [File, IO, File::Constants, Enumerable, Object, Kernel, BasicObject]
# p IO.read "./section040/dummy.txt"



# 

class Foo
  # インスタンスメソッドの場合
  def bar()
    "Foo#bar"
  end

  def imeth
    self   # => #<Foo:0x00007fca2291f818>
    hello  # => [#<Foo:0x00007fca2291f818>, "Foo#bar"]
  end

  # クラスメソッドの場合
  def self.bar()
    "Foo.bar"
  end
  
  def self.cmeth
    self   # => Foo 
    hello  # => [Foo, "Foo.bar"]
  end
end

def bar()
  "Object#bar"
end

def hello 
  # どのbarメソッドが呼ばれるだろうか?
  [self, bar]
end

p Foo.new.imeth  # [#<Foo:0x00007ffc158bf7b8>, "Foo#bar"]
p Foo.cmeth  # [Foo, "Foo.bar"]
