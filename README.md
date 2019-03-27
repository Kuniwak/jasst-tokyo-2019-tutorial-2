JaSST Tokyo 2019 チュートリアル2演習
====================================

> #### チュートリアル2
> 「TLA+で学ぶ仕様の書き方とデバッグの仕方」
> 川口 順央（Preferred Networks）
> 
> ##### セッションの内容
> プログラムをつくるとき、テストをするとき、対象としているシステムがどう振る舞うかを理解していることはとても重要です。この"システムを理解する"は、"まあ、だいたいこんな感じだろう"と頭の中でイメージする程度では不十分で、いざ作業してみると"あっ、そうか"と気づかされることが多いです。仕様を書くという行為は、この"あっ、そうか"という気づきを実装前にたくさん与えてくれます。
> 本チュートリアルでは、TLA+というツールを使って仕様の書き方を学びます。TLA+は、Amazon Web Serviceの開発でも使われているツールです。TLA+を使うことで仕様を書くだけでなく、デバッグも可能になります。書いてデバッグを繰り返すことでたくさんの気づきが得られ、システムをより深く理解することができます。本チュートリアルでは、演習で実際に手を動かして仕様の書き方とデバッグの仕方を学んでいただきます。
>
> [JaSST'19 Tokyo セッション概要](http://jasst.jp/symposium/jasst19tokyo/details.html#H2)



### 実行環境

<details>
<summary>TLA+ Toolbox 1.5.7</summary>

```
TLA+ Toolbox provides a user interface for TLA+ Tools. 

This is Version 1.5.7 of 18 July 2018 and includes:
  - SANY Version 2.1 of 23 July 2017
  - TLC Version 2.13 of 18 July 2018
  - PlusCal Version 1.8 of 16 May 2018
  - TLATeX Version 1.0 of 20 September 2017
```
</details>

<details>
<summary>Java 1.8</summary>

```console
$ java -version
java version "1.8.0_171"
Java(TM) SE Runtime Environment (build 1.8.0_171-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.171-b11, mixed mode)
```
</details>

<details>
<summary>macOS Mojave</summary>

```console
$ sw_vers
ProductName:    Mac OS X
ProductVersion: 10.14.3
BuildVersion:   18D109
```
</details>
