puts self  # => main

@main = "main"  # トップレベルならどこでも読み書きできる、mainに属している

class Hoge
  @class_ivar = "instance variable of Hoge"

  def self.cmeth
    # クラスメソッドなので@class_ivarは見える
    puts @class_ivar  # => "instance variable of Hoge"
  end

  # クラス定義の文脈なので@class_ivarは見える
  puts @class_ivar  # => "instance variable of Hoge"

  def initialize
    @ivar = "ivar"
  end

  def imeth
    # @ivarは見える
    puts @ivar

    # @class_ivarは見えない、未定義なのでnilとなる
    puts @class_ivar  # => 
  end
end

puts @main

Hoge.cmeth
Hoge.new.imeth