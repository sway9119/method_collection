# 配列・ハッシュの要素を取り出す

ary = ["zero", "one", "two"]
# 配列の最初の要素を取り出す。firstも使える
p ary[0]        # => "zero"
p ary.fetch(0)  # => "zero"
p ary.first     # => "zero"

# 配列の最後の要素を取り出す。負の数を指定すると最後の要素から数える。lastも使える。
p ary[-1]       # => "two"
p ary.fetch(-1) # => "two"
p ary.last      # => "two"

# インデックスが1の要素を得る
p ary[1]        # => "one"
p ary.fetch(1)  # => "one"

# []で存在しないインデックスを指定するとnilを返す。
p ary[3]  # => nil

# fetchは要素がなければindexErrorとなる
p ary.fetch(3) rescue $!
# => index 3 outside of array bounds: -3...3 (IndexError)

# fetchに第2引数を与えると要素がない場合に評価される
p ary.fetch(3){|i| "ary[#{i}] is not found"}
# => "ary[3] is not found"

hash1 = {zero: 0, one: 1, two: 2}
hash2 = {0 => "zero", 1 => "one", 2 => "two"}

# ハッシュの値の取り出し
p hash1[:zero]  # => 0
p hash1.fetch(:zero)  # => 0

# 配列同様[]で存在しないKeyを指定するとnilが返る。
p hash2[:three]  # => nil

# 見た目は配列と変わらないが、実はハッシュの値を取り出し
p hash2[0]  # => "zero"

# fetchは配列と同様。キーに対応する値がなく、ブロックも指定されていない場合KeyErrorとなる
p hash1.fetch(:three) rescue $!
# => : key not found: :three (KeyError)
p hash1.fetch(:three, 3)
p hash1.fetch(:three){|key| "hash1[#{key.inspect}] is not found"}
# => "hash1[:three] is not found"