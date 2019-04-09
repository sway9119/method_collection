# 同値性判定
p 0 === 1  # => false
p 1 === 1 or 2 === 1  # => true
#クラス判定（直接のインスタンスである場合）
p Integer === 1  # => true
# クラス判定（サブクラスの場合）
p Numeric === 1  # => true
# モジュールのインクルード判定
p Enumerable === [1]  # => true
# 範囲に入っているか判定
p (1..10) === 5  # => true
# 正規表現マッチ判定
p /cad/ === "abracadabra"  # => true
