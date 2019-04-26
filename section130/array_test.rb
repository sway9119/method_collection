# 配列の要素を1つずつ処理する

ary = ["one", "two", "three"]

# 各要素についてブロックを評価する
ary.each do |s|
  puts "{#{s}}"
end

# => {one}
# => {two}
# => {three}

# ネストした配列は複数のブロックパラメータで受ける
nested1 = [[1,"one"], [2,"two"], [3,"three"]]
nested1.each do |int, english|
  puts "#{int} = #{english}"
end
# => 1 = one
# => 2 = two
# => 3 = three

# ブロックパラメータは多重代入に似たルールで受けるので、複雑にネストした配列も簡単に使える
nested2 = [[1,[1.0,"one"]],[2,[2.0,"two"]],[3,[3.0,"three"]]]
nested2.each do |int, (float,english)|
  puts "#{int}/#{float}/#{english}"
end
# => 1/1.0/one
# => 2/2.0/two
# => 3/3.0/three