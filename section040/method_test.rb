# 呼び出されるインスタンスメソッドの決定方法は、
# そのオブジェクトの特異クラスから「BasicObject」クラスまでの継承ツリーを辿り、
# 最初に見つかったメソッドを呼び出す。
# [呼び出される順番]
# 1.特異メソッド
# 2.extend元のモジュールのメソッド
# 3.自クラスのメソッド
# 4.include元のモジュールメソッド
# 5.スーパークラスのメソッド（スーパークラスを辿っていく）
# 6.BasicObjectクラスのメソッド、トップレベルで定義されたメソッド

class Object;       def foo() "Object#foo" end end
class Super;        def bar() "Super#bar"  end end
class Sub; < Super; def baz() "Sub#foo"    end end
Sub.ancestors  # => [Sub, Super, Object, Kernel, BasicObject]

Sub.new.baz  # => "Sub#foo"
Sub.new.bar  # => "Super#bar"
Sub.new.foo  # => "Object#foo"