require './vars'
require './vars2'

####### section-006 ファイル間でローカル変数は共有できない #######

# グローバル変数は使える
puts $gvar # => 1

# インスタンス変数は使える
puts @ivar # =>

# クラス変数は使える（クラスの定義が必要）
class Name
  puts @@cvar # => 1
end

# CONSTは使える
puts CONST # => 1

# ローカル変数は使えない　
# puts lvar1 # => undefined local variable or method `lvar1' for main:Object (NameError)


####### section-006 ローカル変数の代わりに無引数メソッドを使用する #######

# 無引数メソッドを参照
puts lvar # => 1
# 参照したlvarはmethod
puts defined? lvar # => method
lvar = 2
puts lvar # => 2
puts defined? lvar # => local-variable

# モジュールやメソッド定義など、ローカル変数が見えないスコープでは、lvarメソッドが見えるようになる
module Foo
  puts lvar # => 1 
  puts defined? lvar # => method ( lvar()メソッド )
end

# 再定義しても、ローカル変数lvarが見えるので、ローカル変数が優先される。見えないところでは、再定義が反映。
def lvar() # メソッドの再定義
  3
end
puts lvar # => 2 ローカル変数が見える為

module Foo
  puts lvar # => 3 ローカル変数が見えない為
end

# ローカル変数が見えていても、強制的にメソッドは呼び出される
puts lvar() # => 3