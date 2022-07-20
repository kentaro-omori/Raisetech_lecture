# lecture10 CloudFormationで環境構築

## 構成図
![lecture10 drawio](https://user-images.githubusercontent.com/32190870/179990379-9af61257-c8fd-42ec-a04b-41cc0373577b.png)
---

## VPC構築
* 論理IDに記号が使えないことを知る。(-を使おうとした)
* SubnetのCIDRブロックが競合してるというエラーが出たが、タイプミスが原因であることに気づくのに1時間ほど掛かってしまった。

## EC2構築
* キーペアも作成し、SSH接続できることまで確認した。
* キーペアはキーペアはAWS Systems Managerというところにあった。
![image](https://user-images.githubusercontent.com/32190870/179990525-9defbf57-45f5-4412-9a98-50a0df2e4b0a.png)


## RDS構築
* 今回はMySQLのインストールなどをしていないので、構築のみ

## ELB構築
* ヘルスチェックがUnhealthyな理由を色々調べてしまったが、EC2上にWebサーバー立ち上げてないから当たり前だった。

## S3構築
* ひとまずバケットを作成したのみ。
* DeletionPolicyをRetainにしてみたので、いろいろ試してみた。
    * スタック削除 → バケットは消えない
    * バケット残したまま再度スタック作成 → エラー
    * バケットを手動で削除して再度スタック作成 → 再度バケット作成される

---
## 感想&学び
* スタックを作成する前にymlファイルの検証をaws cliで実施した。明確にエラーが見つかることもあったが、内容によってはエラーは出ずともスタック作成時にエラーが出ることもあったので過信は禁物。 
    * `$ aws cloudformation validate-template --template-body file://lecture10-CFn-VPC.yml`
* VS Codeでymlの編集を行ったがファイルのエンコードがUTF-8だとaws cliで検証掛けた時にエラーになるため、Shift JISに変更する必要があった。
* EC2の構築以降は`aws cloudformation create-stack`、`aws cloudformation update-stack`もaws cliで実施した。
* 今回はリソースごとに分割したが、どう分割するのが最適なのかは公式のベストプラクティスをよく読んでみる。
    * https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/best-practices.html#organizingstacks
* 公式のユーザーガイドと色々な人の書き方を見て今回の課題に臨んだが、自分のものとするにはやはり反復練習が必要なので同じ構成でも違った書き方で構築することもやってみたい。
