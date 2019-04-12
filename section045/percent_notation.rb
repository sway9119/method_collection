# 「%!STRING!」と「%Q!STRING!」:ダブルクォート文字列
# => Qのあるなしは関係ない。

p %!ab\n!                   # => "ab\n"
p %Q!ab\n!                  # => "ab\n"
p %!1+1 = #{1+1}!           # => "1+1 = 2"
p %Q!1+1 = #{1+1}!          # => "1+1 = 2"
p "\"abc\""                 # => "\"abc\""
p %#"abc"#                  # => "\"abc\""
p %((abc))                  # => "(abc)"
p %!<a href="\">site</a>!   # => "<a href=\"\">site</a>"
p %Q!<a href="\">site</a>!  # => "<a href=\"\">site</a>"

# 「%q!STRING!」:シングルクォート文字列
p '<a href=\'/\'>Top</a>'   # => "<a href='/'>Top</a>"
p %q!<a href='/'>Top</a>!   # => "<a href='/'>Top</a>"
p %q((let ((a 1)(b 2))(+ a b)))  # => "(let ((a 1)(b 2))(+ a b))"
p %Q((let ((a 1)(b 2))(+ a b)))  # => "(let ((a 1)(b 2))(+ a b))"

# 「%x!STRING!」：コマンド出力
p `echo backquote`          # "backquote\n"
p %x[echo backquote]        # "backquote\n"
p `echo "#{2+3}\t#{1+6}"`   # "5\t7\n"
p %x$echo "#{2+3}\t#{1+6}"$ # "5\t7\n"
# コマンド出力がネスとしている場合に有用。
p `echo \`echo hoge\``      # "hoge\n"
p %x!echo `echo hoge`!      # "hoge\n"

# 「%r!STRING!」：正規表現
p %r!foo!                    # /foo/
p /<title>(.+?)<\/title>/m   # /<title>(.+?)<\/title>/m
p %r!<title>(.+?)</title>!m  # /<title>(.+?)<\/title>/m

# 「%w!STRING!」と「%W!STRING!」：要素が文字列の配列
# 1つ以上の空白文字を区切りとした文字列配列を作成する。要素に空白文字を含めるときはエスケープする。
# 「%W」では式展開とバックスラッシュ記法を使うことができる
# 「%w」では式展開とバックスラッシュ記法を使うことができない。
p %w[a b c d]                # ["a", "b", "c", "d"]
p %w[a#{'b'}\ c defg]        # ["a\#{'b'} c", "defg"]
p %W[a#{'b'}\ c defg]        # ["ab c", "defg"]

# 「%s!STRING!」：シンボル
# シンボルを作成する。が、ほとんど使わない。
p %s!foo!  # => :foo
