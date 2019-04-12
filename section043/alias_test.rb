# aliasもundefもキーワード
# キーワードは引数の評価がされない。
# 引数にとるメソッド名はメソッド名そのものかシンボル。
# メソッド名がローカル変数と見なされるわけではない。
# aliasキーワードを設定すると、メソッド名（foo）の代わりにエリアス名（bar）が使えるようになる。
# alias エリアス名 対象メソッド名

class Example
  def foo() :original end
  alias bar foo
end

obj = Example.new
p obj.foo  # => :original
p obj.bar  # => :original

# あくまでコピーなので、再定義後は、再びaliasする必要がある。
class Example
  def foo() :redefined end
  alias bar foo # !> discarding old bar
end

p obj.foo  # => :redefined
p obj.bar  # => :redefined