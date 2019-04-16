# オブジェクトのコピーについて
# 破壊的メソッドを使用する場合は、オブジェクトをコピーしてから使用する。
# コピーするメソッドは2つ。「Objrct#dup」「Object#clone」

# dupは内容のみ。オブジェクトの内容と汚染状態をコピーする。
# cloneは、dupに加え、得意メソッドやフリーズ状態も含め完全なるコピーを生成する。
# どちらも浅いコピーであり、配列をコピーする場合、要素まではコピーされない。
# 深いコピーを行う場合は、Marshalを使う。

a = ["a"]

# aの特異メソッドhogeを定義してみる。
def a.hoge()
  "singleton method!"
end

p b = a.clone  # => ["a"]
# クローンは同一ではない。
p b.equal? a  # => false

# クローンは特異メソッドもコピーされる。dupはコピーされない。
p b.hoge  # => "singleton method!"
# p a.dup.hoge  # => undefined method `hoge' for ["a"]:Array (NoMethodError)


# aの要素も同じ"a"をさしている（浅いコピー）
p a[0].equal? b[0]  # => true

# 要素に破壊的メソッドを適用すると両方とも書き変わってしまうので注意
a[0].upcase!
p [a[0], b[0]]  # => ["A", "A"]

# 深いコピーを生成するメソッドを定義する
class Object
  def deep_clone()
    Marshal.load(Marshal.dump(self))
  end
end

a = ["a"]

# 深いコピーは要素もコピーされる
p c = a.deep_clone  # => ["a"]
p a[0].equal? c[0]  # => false
# 破壊的メソッドを適用しても深いコピーは影響されない。
a[0].upcase!
p [a[0], c[0]]  # => ["A", "a"]

# 配列のやや深いコピーはmapを使うといいが、多次元配列の要素まではコピーされない。
class Array
  def map_clone()
    map{ |x| x.clone }
  end
end

# Marshalではコピーできなかったものがmapだとできる。
a = ["a", ["b"], Proc.new{}, $stdpout]
def a.hoge()
  "signletion method!"
end
p c = a.map_clone  # => ["a", ["b"], #<Proc:0x00007f9c4f8e63e8@section052/copy_test.rb:57>, nil]

# 配列の要素はコピーされている。
# しかし同一ではない。
p a[0].equal? c[0]  # => false

# ”b”は同じものをさしているので破壊的メソッドを適用したら両方変更される。
p a[1][0].equal? c[1][0]  # => true