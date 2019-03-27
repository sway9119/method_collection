module Nest
  @@cv = "nest"

  class SuperClass
    @@cv = "super"
  end

  class SubClass < SuperClass
    puts @@cv  # => "super"
    @@cv = "sub"
  end

  class SuperClass
    # 共有されているのでスーパークラスに影響が及ぶ
    puts @@cv  # => "sub"
  end

  puts @@cv  # => "nest"
end