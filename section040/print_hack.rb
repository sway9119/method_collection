# 関数を呼び出すクラスでは、
# 関数として定義しているメソッド（selfで定義しているもの）と同名のメソッドを定義しない。

class PrintHack
  def print(args)
    puts(args, "AAARRGH!")
  end
  def run()
    func "output"
  end
end

# printHack#printが呼ばれてしまう！
def func(str)
  print str
end

PrintHack.new.run