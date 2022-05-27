## APサーバーについて調べてみる
### APサーバーの名前とバージョン
```
$ puma --version
```
* puma version 5.6.4

### APサーバーを終了させたときの動作
* Oops No application seems to be running here!  
と表示される。

APサーバーを再度起動させると正常に表示される。

---

## DBサーバーについて調べてみる
### DBサーバーの名前とバージョン
```
$ mysql --version
```
* mysql  Ver 8.0.29 for Linux on x86_64 (MySQL Community Server - GPL)

### DBサーバーを終了させたときの動作
```
$ sudo service mysqld stop
```
* ActiveRecord::ConnectionNotEstablished  
Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2)  
というエラーが表示される。

DBサーバー、APサーバーを再起動させると、正常に表示されることを確認。

---

## Railsの構成管理ツールの名前
* Bundler

---

## 今回の講義で学んだこと
* どの言語でも環境構築は大変だと感じた。特にサーバーやDBが絡んでくると大変さが増すと感じた。
* そうは言ってもエラーメッセージに品となり答えなりが書いてあるので、個人的には謎解きのようで面白い。
