CONST = "toplevel"

class SuperClass
  CONST = "superclass"
end

class AClass
  # ネストの外側がないのでスーパークラス（Object）の定数が参照される
  puts CONST
end

class SubClass < SuperClass
  # ネストの外側がないのでスーパークラス（SuperClass）の定数が参照される
  puts CONST
end

module Nest
  CONST = "nest"
  
  class SubSubClass < SubClass
    # まずネストの外側が優先的に参照される
    puts CONST  # => "nest"
  end

  # ネストの外側がないのでスーパークラスの定数が参照される
  puts SubSubClass::CONST  # => "superclass"

  # ::から定数を始めるとトップレベルの定数が参照される
  puts ::CONST  # => "toplevel"

end

# スーパークラスの定数が参照される
puts Nest::SubSubClass::CONST  # => "superclass"
puts SubClass::CONST  # => "superclass"

