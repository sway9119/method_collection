# 文字列を取り除く
# slice(開始,文字数)を取り除く

str = "わかめごはん"

# インデックス0から3文字を取り除き、取り除いた文字列を返す。
str2 = str.dup; str2.slice!(0,3)
p str2  # => "ごはん"

# インデックスから3~5を取り除く
str3 = str.dup; str3.slice!(3..5)
p str3  # => "わかめ"

# 正規表現/わかめ/に最初にマッチする部分を取り除く
str4 = str.dup; str4.slice!(/わかめ/)
p str4  # => "ごはん"

# 最初にマッチした"ご飯"を取り除く
p str5 = str.dup; str5.slice!("ごはん")  # => "ごはん"
p str5  # => "わかめ"

# 正規表現/わかめ(ごはん)/の1番目の()にマッチする部分を取り除く
str6 = str.dup; str6.slice!(/わかめ(ごはん)/, 1)
p str6  # => "わかめ"

# shift_JIS文字列を作る
str7 = "わかめ".encode("CP932")
# エンコーディングが異なるのでエラーになる
str8 = str.dup; str8.slice(str7) #rescue $!
# => incompatible character encodings: UTF-8 and Windows-31J (Encoding::CompatibilityError)

