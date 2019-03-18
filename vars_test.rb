require './vars'

# グローバル変数は使える
puts $gvar

# インスタンス変数は使える
puts @ivar

# クラス変数は使える（クラスの定義が必要）
class Name
  puts @@cvar
end

# CONSTは使える
puts CONST

# ローカル変数は使えない　undefined local variable or method `lvar1' for main:Object (NameError)
puts lvar1
