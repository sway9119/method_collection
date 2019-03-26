a0 = 0  # トップレベルのローカル変数10はプログラム終了まで見える

class AClass
  # puts "lvar_a0: #{a0}"  # => undefined ここではa0は見えない。
  
  a1 = 1  # a1はクラス定義スコープで/classまで有効
  
  def a_method
    # puts "class_a1: #{a1}"  # undefined ここではa1は見えない。
    puts "a_method!!"
  end

  def initialize
    # puts "class_a1: #{a1}"  # undefined ここではa1は見えない。

    a2 = 2
    a3 = 3  # a2とa3はメソッド定義スコープまで/defまで有効
   
    [[1,2]].each do |x, a3|
      # 以後ブロックスコープ。a2は見える
      puts "dlock_a2: #{a2} => 2"
      a4 = 4  # ブロック内で宣言されたローカル変数はブロック外では見えなくなる
      puts "dlock_x: #{x} => 1"
      puts "dlock_a3: #{a3} => 2"
    end

    # ブロックを抜けたのでa3は3
    puts "def_a3: #{a3} => 3"

    if true  # ifは制御構造なのでスコープは作らないので注意
      a4 = 4  
    else
      a4 = 5
    end

    puts "def_a4: #{a4} => 4"

    # 変数宣言されていないので無引数メソッド呼び出しになる
    puts "#{a_method} => a_method!!"

  end  # /def
end  # /class

puts "lvar_a0: #{a0} => 0"


AClass.new