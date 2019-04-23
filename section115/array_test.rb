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

# Array.new(size, value)での配列の作成
# Array.newはブロックではなく引数で初期値を取ることができるが、全要素が同一オブジェクトとなる。(同一要素問題)
p Array.new(3, "bar".freeze)  # => ["bar", "bar", "bar"]
p Array.new(3, 0)  # => [0, 0, 0]

# Array(arg)での配列の作成
# Kernel#Arrayは配列への変換を行うメソッド。
# to_aryメソッドによる暗黙の型変換を試みて、to_aメソッドを呼び出す。
p Array([1,2])  # => [1, 2]
p Array([[1],2])  # => [[1], 2]
p Array(0..3)  # => [0, 1, 2, 3]
p Array(3)  # => [3]

# ハッシュのテスト
# ハッシュの特徴はキーから値の取り出しが高速であるところ。
# シンボルをキーにしたハッシュは、キーと値を：で区切るリテラルを使うことができる。
p({ one: 1, two: 2, three: 3})  # => {:one=>1, :two=>2, :three=>3}
p({ host: "127.0.0.1", port: 9999})  # => {:host=>"127.0.0.1", :port=>9999}
