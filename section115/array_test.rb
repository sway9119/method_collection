# 配列。ハッシュを作成する

# Rubyの配列は、どんなオブジェクトでも要素にすることができる。
[3,7]
["foo","bar"]
[1,1.1,"string",Object, [],]

# 文字列とシンボルの配列は、「%w」「%W」「%i」「%I」などの%記法が使える。
# 「\」は空白文字で区切る。
p %w[one two three\ four]  # => ["one", "two", "three four"]
p %W[#{'hello'.upcase} world\n]  # => ["HELLO", "world\n"]
p %i[one two three\ four]  # => [:one, :two, :"three four"]
p %I[one two three #{'four'.upcase}]  # => [:one, :two, :three, :FOUR]

# Array.new(size)での配列作成
# あらかじめ固定要素数の配列を作成するには「Array.new」で引数に要素数をしていする。
p Array.new(3)  # => [nil, nil, nil]

# ブロックをつけた場合は要素ごとにブロックを評価し、評価結果が配列の要素になる。
p Array.new(3){"foo"}  # => ["foo", "foo", "foo"]

# ブロックパラメータはインデックスを取る。0からlength-1まで。
p Array.new(11){|i| i}  # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p Array.new(11){|i| i*i}  # => [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
