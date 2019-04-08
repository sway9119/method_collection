class Super 
  def func1()
    "Super#func1" 
  end
end

class Sub < Super
  def func2()
    "Sub#func2"
  end

  def run
    puts self  # => #<Sub:0x00007f9a6413feb0>

    # Sub1#func1がないので、Super#func1にを探して表示している
    puts func1  # => Super#func1
    
    # class内にfunc2があるのでそれを呼び出している
    puts func2  # => Sub#func2
    "Sub#run"
  end
end

# puts Sub.new.run  # => "Sub#run"


# モジュールをインクルードしている場合
# ArrayはEnumerableをincludeしている。
# ArrayはObjectのサブクラスだが、モジュールをインクルードしているのがわかる。

p Array.ancestors  # => [Array, Enumerable, Object, Kernel, BasicObject]

# Arrayのメソッドでpartitionは定義されていないので、Enumerable#partitionが呼ばれる。
# ちなみに数字[1,2]はNumericである。
p [1, "one", 2, "two"].partition {|x| x.kind_of?(Numeric)}
# => [[1,2],["one","two"]]

#「includeしたモジュール」と「スーパークラス」のどちらともにメソッドが定義されている場合、
# 継承ツリーをたどるという基本にのっとり、「includeしたモジュール」が優先される。
class Super;  def which()  "Super#which"   end  end
module Mod;   def which()  "Module#which"  end  end
class Sub < Super; include Mod;  end

p Sub.ancestors  # => [Sub, Mod, Super, Object, Kernel, BasicObject]
p Sub.new.which  # => "Module#which"


# inclede元のモジュールメソッドを自クラスで再定義することもできる。
# 言い換えると、includ元のモジュールメソッドより、自クラスが優先される。
# 再定義後にincludeしても変わらず。
module Mod;   def which()  "Module#which"  end  end
class Sub < Super; include Mod;   def which() "Sub#which" end  end
p Sub.new.which  # => "Sub#which"

module Mod;   def which()  "Module#which"  end  end
p Sub.new.which  # => "Sub#which"

Sub.include Mod;
p Sub.new.which  # => "Sub#which"
