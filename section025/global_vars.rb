$gvar = 1

class X
  puts $gvar  # => 1

  class Y
    puts $gvar  # => 1
  end
end

def foo
  puts $gvar  # => 1
end

foo