# lecture12 CircleCIを使ってみる
CircleCIのサンプルコンフィグを使用
https://github.com/MasatoshiMizumoto/raisetech_documents/tree/main/aws/samples/circleci

* 結果
(画像)
---
## 感想&学び
* CircleCIのチュートリアル実施し、サンプルコンフィグを使ってlecture10で作成したCFnのymlファイルのチェックをかけたところ以下のエラーが発生した。  
`2022-07-30 07:25:03,607 - cfnlint.decode - ERROR - Cannot read file contents: cloudformation/lecture10-CFn-EC2.yml`  
 調べてみるとまたもWindowsの文字コードが原因であった・・・  
 さらに今回は該当ファイルから日本語を消してもエラーが解消されず、結局元から日本語コメントを使用していなかったELB用のymlファイルのみの構成にしたところチェックが通るようになった。  
 こういうエラーが続くとWindowsでやっていくのがしんどくなる(意訳：mac欲しい)。