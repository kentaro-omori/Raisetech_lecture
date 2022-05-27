# Cloud9上でのサンプルアプリケーションの起動手順
* リポジトリのクローン
```
 $ git clone https://github.com/yuta-ushijima/raisetech-live8-sample-app.git
```

* 必要ファイルのインストール
```
$ bundle install
```
### bundlerが無いと言われたのでインストールし、必要ファイルのインストールを再実行
```
$ gem install bundler:2.2.28
$ bundle install
```
### mysql2 (0.5.4)のインストールでエラーが起きた。
OneDriveにある"Cloud9 上での MySQL セットアップ方法"を元に作業実施  
1. ディスク容量の確保
2. Amazon LinuxでのMySQLインストール  
mysql-community-develのインストール時にGPG Key関連のエラーが出るので、新しいGPG KeyをインポートしてからMySQLをインストールする。
```
$ sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
$ sudo yum install -y mysql-community-devel
$ sudo yum install -y mysql-community-server
```

3. 初期パスワードの入手＆動作確認  

* 改めて必要ファイルのインストール
```
$ bundle install
```
Bundle complete!

* MySQLへrootでのログイン確認完了
* config/database.ymlにrootのパスワード貼り付け

* DBの作成
```
$ bundle exec rails db:create
```

### Mysql2::Error::ConnectionErrorが出た
socketファイルの場所がデフォルトの位置にないのでconfig/database.ymlを修正。
```
 - /tmp/mysql.sock
 + /var/lib/mysql/mysql.sock

```

* 再度DBの作成
```
$ bundle exec rails db:create
```

### ActiveRecord::ConnectionNotEstablished: Access denied for user 'root'@'localhost' (using password: YES)
MySQLのrottユーザーパスワードのリセットが必要
```
$ mysql -u root -p
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'RaiseTech_20220521';
mysql> select * from mysql.user where user='root' \G
mysql> exit
```
Query OK, 0 rows affected (0.11 sec)

* 再々度DBの作成
```
$ bundle exec rails db:create
```
Created database 'raisetech_live8_sample_app_development'
Created database 'raisetech_live8_sample_app_test'

* DBにテーブルを作成
```
$ bundle exec rails db:migrate
```

* サーバー起動
```
$ bundle exec rails server -b 0.0.0.0
```

* Preview -> Preview Running Application実施

### Blocked hostエラー
config/environments/development.rbの末尾(endの前)にエラー画面に表示されたconfig.hosts << "a82….amazonaws.com"を貼り付け


* Ctrl+cでサーバー停止し、再度サーバー起動
```
$ bundle exec rails server -b 0.0.0.0
```
## Webpacker::Manifest::MissingEntryError in Fruits#indexと出る

* Ctrl+cでサーバー停止し、webpackerをインストール
```
$ bundle exec rails webpacker:install
```
Yarn not installed.

* 先にYarnをインストール
```
$ npm install -g yarn
$ yarn --version
1.22.18
```
* 改めてwebpackerをインストール
```
$ bundle exec rails webpacker:install
Webpacker successfully installed 🎉 🍰
```


* サーバーを再々起動
```
$ bundle exec rails server -b 0.0.0.0
```
a827b1a61956412f8868ab5395ada09d.vfs.cloud9.ap-northeast-1.amazonaws.com で接続が拒否されました。  
と表示されたが、Preview右上のPop out in new windowで開いたら無事に表示された
