# オブジェクトの比較について
# 宇宙船演算子 self <=> other 
# selfが、大きい場合は正、等しい場合は0、小さい場合は負を返す。

p 1 <=> 2  # => -1
p 1 <=> 1  # => 0
p 2 <=> 1  # => 1
p 3.between?(1,3)  # => true 3は1~3に含まれている


# 数値として比較
# self < other selfがotherより小さい場合true
p 2 < 10  # => true
# 文字列として比較
p "2" < "10"  # => false
p "abc" < "def"  # => true 文字のインデックスを比べている？
p "def".between?("abc","ghi")  # => true 文字のインデックスを比べている？

# クラス・モジュールは特化した方が「小さい」。より深い方が小さい
p Array <=> Object  # => -1
p Array < Object  # => true
p Object < Array  # => false
p Array < Enumerable  # => true

# 直接関係のないクラス・モジュールを比較したらnilになる
# 「clamp」はmin,maxで指定した範囲内の値を返す。
p Hash <=> Array  # => nil
p Hash < Array  # => nil
if RUBY_VERSION > '2.4'
  p 12.clamp(0,100)  # => 12
  p 523.clamp(0,100)  # => 100
end
