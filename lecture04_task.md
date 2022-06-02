## 第4回課題
### EC2からRDSへ接続
TeraTermでEC2にSSHで接続し、mysqlをインストール後にRDSに接続した。  
![image](https://user-images.githubusercontent.com/32190870/171542027-d8f10611-4b73-431a-a205-0af060e5fa55.png)


### 今回の構成図
![lecture04_diagram](https://user-images.githubusercontent.com/32190870/171542077-6ec82347-ce02-4cd4-bab9-0fb43ae2e16f.png)

### メモ&感想
* RDSの構築時に最初サブネットグループをデフォルトで作成してしまったため若干ハマったが、  
サブネットグループを新規で作成してからRDSを再構築することでEC2から接続できるようになった。
* やっぱり手を動かしてみないと理解できないことが多いので、課題をこなしたうえでさらに良い方法がないかも探っていきたい。
