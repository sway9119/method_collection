# 文字を挿入する

str = "Cコンパイラ"

# インデックス1の直前に「++」を挿入する
str1 = str.dup; str1.insert(1, "++")  # => "C++コンパイラ"
p str  # => "C++コンパイラ"

# []で挿入する
str2 = str.dup; str2[1,0] = "++"
p str2

# エンコーディングが異なるのでエラー
str3 = str.dup
str4 = "言語".encode("CP932")
p str3.insert 1, str4 rescue $!
# => incompatible character encodings: UTF-8 and Windows-31J (Encoding::CompatibilityError)
