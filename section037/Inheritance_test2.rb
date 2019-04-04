# クラスの継承2
# サブクラスでスーパークラスのメソッドを再定義する
# サブとスーパーで同じ名前があった場合、継承が深い方から優先的にメソッドが呼ばれる。
# サブ路スーパーで同じ名前があった場合、super（関数メソッド）を使うとスーパークラスのメソッドが優先的に呼ばれる
# superがないとエラー。

class Super
  def foo( arg = 0 ) "<#{arg}>" end
  def bar( baba = 0 ) baba end # 引数返すだけって意味ないよな笑
end

class Sub < Super
  def foo(arg)
    puts arg  # => 3
    puts super  # => <3>
    puts super(1)  # => <1>
    puts super 1  # => <1>
    puts super()  # => <1>
    arg = 10
    puts super  # => <10>
  end

  def bar(baba)
    puts baba  # => 4 これはSubのメソッド
    puts super(678)  # => 678　これは同じ名前のSuperのメソッド
  end

  def yoo(yabe)
    puts yabe
    #puts super # no superclass method `yoo' for #<Sub:0x00007fc5b59035a8> (NoMethodError)
  end
end

sub = Sub.new
sub.foo(3)
sub.bar(4)
sub.yoo(5)