# 例外処理
# Kernel#raiseで明示的に例外を発生させることができる。
# 無引数の場合は、同じスレッドの同じブロックで最後に捕捉された例外(「$!」)を再発生させる。
# 捕捉された例外がない場合、「unhandked exception」というエラーメッセージで「RuntimeError」が発生する。

begin
  raise "raise a RuntimeError"
rescue
  p $!  # => #<RuntimeError: raise a RuntimeError>
end

raise ArgumentError, "invalid argument" rescue p $!
# => #<ArgumentError: invalid argument>

# 例外処理で修復した後に再試行するには「retry」キーワードを使用する。
# begin式でretryが呼び出された場合、bigin式の本体を再評価する

i = 0
begin
  raise if i == 0
  p i
rescue
  # i == 0時に飛ばされる
  i = 1
  retry
end
# >> 1

# 例外が起きようと必ず評価する式を記述するためには、ensure節を使用する。
# 後片付けする。例えば、ファイルを開いたら閉じとか、一時的に使用する作業ファイルを作成したら削除するなどの用途。
begin
  # content = File.load
ensure
  # File.close
end

# rescue節
ary2 = [[1,2],[3,4]]
p ary2[0]  # => [1, 2]
p ary2[0][0]  # => 1
p ary2[0][9]  # => nil
p ary2[9]  # => nil
# nil[0]で例外が起きるため、捕捉してnilを返す。
p ary2[9][0] rescue p nil
