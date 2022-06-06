## 第5回課題

### EC2上にサンプルアプリケーションをデプロイして動作させる
* 前回の課題で作成したEC2上でサンプルアプリが動くように環境構築。  
サンプルアプリが動くことを確認。
![image](https://user-images.githubusercontent.com/32190870/172133027-8ccedc76-5f33-4d31-94ca-1ec1cfe9d6c2.png)

### EC2の冗長化
* 前項で作成したEC2のAMIを作成し、別のAZでEC2インスタンス(raisetech2)を起動
![image](https://user-images.githubusercontent.com/32190870/172133128-9251e5d1-28e2-4af1-bc79-b0b5ca16c2da.png)
![image](https://user-images.githubusercontent.com/32190870/172133391-6f002e12-d230-4d62-a7c8-c73fb7f896ba.png)
* こちらのEC2でもサンプルアプリが起動することを確認
![image](https://user-images.githubusercontent.com/32190870/172133502-20b79807-b2cb-419e-a3b6-e7ab57875a5c.png)

### ELB(ALB)の追加
* 2つのEC2のインスタンスでターゲットグループを作成し、ALBを作成。
![image](https://user-images.githubusercontent.com/32190870/172133975-5e613757-f96b-408d-b534-57732fd410bd.png)
![image](https://user-images.githubusercontent.com/32190870/172134013-5f0a8b34-a1de-419e-b05b-2cb6bacb3d9a.png)
* ELB経由でサンプルアプリにアクセスできることを確認。
![image](https://user-images.githubusercontent.com/32190870/172134374-335a7166-1214-4f92-a610-2673fc2368c6.png)

### S3を追加
* S3に画像を配置し、その画像をAZ-a/AZ-cそれぞれの静的ファイル(404.html)に埋め込み、表示したときにどちらのAZのEC2からWEBサイトが表示されているか分かるようにした。
![image](https://user-images.githubusercontent.com/32190870/172134484-151307f9-d034-44fd-9015-ed1605800d9e.png)
* AZ-aのみサーバー起動時
![image](https://user-images.githubusercontent.com/32190870/172146541-c4e146a7-662e-42f0-a0b1-746899b33853.png)
* AZ-cのみサーバー起動時
![image](https://user-images.githubusercontent.com/32190870/172146585-9b565397-4ab4-4a22-9e7b-6b634decca87.png)

### 構成図
![lecture05_diagram](https://user-images.githubusercontent.com/32190870/172146154-259988ac-3d78-4be6-b69c-12674fedfb13.png)

## 感想&メモ
* EC2を冗長化する際にEC2の複製が必要とは考えたものの方法が分からなかった。自分が作成したEC2からもAMIを作れることを知った時は"なるほど！"と思った。
* EC2の冗長化までは割とスムーズに進んだが、ALBの追加で若干躓いた。"ポートどうするんだろう？"と疑問に思っていたので、検索ワードにたどり着くのは早かった。
* S3に追加した画像は本当はTOPページに表示したかったけど、Railsアプリのいじり方が分からなかったので、静的ファイルに入れ込みました(ちょっとずるい？:sweat_smile:)。
