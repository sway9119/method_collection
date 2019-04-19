# 文字列の長さを求める。
p "abcdef".length  # => 6
# 日本語文字列でもきちんと文字列を返してくれる
ja = "日本語"
p ja.length  # => 3
p ja.size  # => 3
p ja.chars.count  # 3
# バイト数を得たい場合はString#bytesizeを使う
p ja.bytesize  # => 9
p ja.encode("CP932")  # => "\x{93FA}\x{967B}\x{8CEA}"
# bytesizeはエンコーディングで異なる
p ja.encode("CP932").bytesize 

