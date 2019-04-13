# 同値だが同一ではない例
# 文字列は評価されるたびにオブジェクトが作られる
a = "str"
b = "str"
p a.object_id # => 70271767782220
p b.object_id # => 70271767782200
# aとbは同値だが同一ではない
p a == b  # => true
p a.equal? b  # => false

# 同一の例
a = "str"
# 同じオブジェクトに2つの名札を貼り付けただけなのでaとbは同一
b = a
p a.object_id  # => 70271767781820
p b.object_id  # => 70271767781820

# 同一ならば同値でもある
p a == b  # => true
p a.equal? b  # => true

# FixnumとSymbolは例外的に一意的なIDが割り当てられるので同一
a, b = 7, 7
p a.object_id  # => 15
p b.object_id  # => 15
p a == b  # => true
p a.equal? b  # => true

x, y = :ruby, :ruby
p x.object_id  # => 664668
p y.object_id  # => 664668
p x == y  # => true
p x.equal? y  # => true
