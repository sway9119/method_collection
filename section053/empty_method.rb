# オブジェクトが空であるかどうかを調べる。

# 空文字列、空配列、空ハッシュでtrueになる
# {}.empty? ではNoMethodErrorになってしまう。
p "".empty?  # => true
p [].empty?  # => true
p ({}).empty?  # => true
# 空白文字のみの文字列では空とはみなされない
p " ".empty?  # => false

# nilやfalseにはempty?が定義されていないのでエラーとなる
#nil.empty?  # => undefined method `empty?' for nil:NilClass (NoMethodError)
#false.empty?  # => undefined method `empty?' for nil:NilClass (NoMethodError)

# 空のオブジェクトは偽ではなく真である。注意！
if "" # !> string literal in condition
  puts "空文字列は真である"
else
  puts "空文字列は偽である"
end
# => 空文字列は真である