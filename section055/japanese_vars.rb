# Rubyでの日本語の扱いについて
# 日本語でメソッド定義とかできる

def 日本語のメソッド()
  変数名 = [ "文字列", /正規表現/ ]
  return 変数名.first
end

puts 日本語のメソッド

# 文字列にはそれぞれにエンコーディングが設定されている。
# 文字列は文字単位での扱いが可能。

# 3文字目から抜き出す。
p "0あ12"[2,2]  # => "12"
# 最初か2文字抜き出す
p "0あ12"[0,2]  # => "0あ"

# 複数のエンコーディングの文字列を共存させることもできる。
# ただし、そのまま結合・比較・正規表現マッチはできないので、エンコーディングを変換して揃える必要がある。