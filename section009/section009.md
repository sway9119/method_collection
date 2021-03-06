# オブジェクト指向について

## Rubyは純粋なオブジェクト指向プログラミング言語
Rubyは設計当初からオブジェクト指向を念頭に置いている言語。
Rubyのデータは全てがクラスに属したオブジェクト。
その為、整数であろうがユーザー定義クラスのオブジェクトだろうが、メソッド呼び出しができる。

### オブジェクト・クラス・メソッド
クラスは、データだどう種類のもので、どういう振る舞いをするかを決定付ける枠組み。
オブジェクトの振る舞いはメソッドで定義される。
メソッドは、オブジェクトと結びついた関数のこと。（C++でいうメンバ関数）

```
例）文字列"abcd"の長さを調べる
ruby: "abcd".length
C   : strlen("abcd") 
```
Rubyの場合、オブジェクト（主役）が前に来る。
オブジェクト"abcd"のlengthメソッドを使うイメージ。
この主体となるオブジェクトを「レシーバ」という。

Arrayの長さを調べるときとクラスの長さを調べる時は、
コンピュータからすれば別の処理でも、人間からすれば同じ長さを求める行為。オブジェクト指向というのは、人間目線。

### ポリモーフィズ
オブジェクト「obj」の長さを調べたい場合、objが
文字列の場合、Stiring#lengthが呼び出され、
配列の場合、Array#lengthが呼び出される。
オブジェクトによって最適なメソッドが選ばれるような、ポリモーフィズ（多態）と呼ぶ。

### カプセル化
オブジェクトは内部構造をユーザから隠し、メソッド経由でしか操作できないようになっている。ユーザは内部構造を知らず、開発者は振る舞いを保持したまま自由に変更できる状態のこと。

### インスタンス
オブジェクトと同じ意味。ただ、クラスに属しているオブジェクトというニュアンスが強い。
配列[1,2]は「配列オブジェクト」とも「配列クラスのインスタンス」ともいえる。
ただ、クラスとインスタンスの違いを明確にする。
配列[1,2]でいう、配列がクラス、[1,2]がインスタンス。[3,4]もインスタンスとなりうる（＝インスタンスはたくさん作成できる）

### 継承と Mix-in
クラスの継承とは、あるクラスに機能を追加したクラスを作成すること。
Rubyでは、継承元となるクラスを「スーパークラス」という。（親クラス、基本クラス、基底クラスとか表現する言語もある）
Rubyでは、継承されたクラスを「サブクラス」という。（子クラス、派生クラス、導出クラスとか表現する言語もある）
サブクラスは、スーパークラスのメソッドを全て受け継ぐ。
サブクラスで、スーパークラスのメソッドを書き換えることもできる。
複数の継承を多重継承と呼ぶが、Rubyでは意図的にサポートしていない。（混乱する為）
その代わり、モジュールから機能を追加するMix-inがある。
クラス階層を表現する継承と機能を共有するためのMix-inをうまく使い分けるのがRubyの設計では重要。

### クラスもオブジェクト
Rubyでは、クラスもオブジェクト。
Stiringクラスは、Classクラスのインスタンス。
Classクラスではクラス全体の振る舞い方を定義している。
例えば、オブジェクトはnewメソッドで作成するが、それは、Classクラスで定義している。

### 関数
厳密には、Rubyに関数は存在しない。レシーバを指定しないでメソッド呼び出しができると関数に見えるが、関数的メソッドとは、いっそ関数とかいったりする。（＝レシーバがないものが関数）

### インスタンスメソッドとクラスメソッド
インスタンスメソッドとは、インスタンスと結びついたメソッドのこと。
単にメソッドという場合は、インスタンスメソッド。
クラスメソッドとは、クラスと結びついたメソッドのこと。クラsスメソッドの場合、インスタンスを生成しなくてもいきなり使える。

