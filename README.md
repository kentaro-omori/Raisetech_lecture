# 最終課題
- CircleCIで下記のWorkflowを実行するサンプルリポジトリ

## Workflow
1. リポジトリにコードをpush
2. CircleCIがリポジトリにpushされたことをイベントトリガーとして、workflowを実行
3. 最初のworkflowとしてCloudFormationを実行
4. 2番目のworkflowとしてCloudFormationによって作成されたAWS環境に対して、ansibleを実行
5. 3番目のworkflowとしてServerspecで自動テストを実行する

## 実行環境

### ansible
```
ansible [core 2.12.7]
```

### orbs
```
aws-cli: circleci/aws-cli@3.1.3
ansible: orbss/ansible-playbook@0.0.5
ruby: circleci/ruby@1.8.0
```

## 構成図
![lecture14 drawio](https://user-images.githubusercontent.com/32190870/192124704-5c07ab3d-911c-48c9-9774-6e96364f20b0.png)


## CircleCI上で設定した環境変数
![image](https://user-images.githubusercontent.com/32190870/192124728-73d152b2-ec9c-4542-9ba0-d370fa792dfe.png)


## 感想&学び
* CloudFormation、Ansible、Serverspecそれぞれで苦戦はしたが、とにかくAnsibleによるRails環境構築に時間が掛かった。  
db:create関連でかなりハマったが、講義動画を見直しながら抜け漏れがないかチェックし、一つずつエラーをつぶしていった。
* なるべく秘密情報をハードコーディングしないためにCircleCIの環境変数を活用したが、CircleCI、Ansible、EC2それぞれの関係が頭の中でごちゃごちゃしてしまい、今設定した環境変数がどこに設定されているのか、どこにファイルが出来ているのかなど整理が必要だった。  
(混乱しすぎてAnsibleのtaskの中でさらにEC2にSSH接続しようとしたこともあった)
* CircleCIのWorkspaceにたどり着くまでjob間のファイル共有方法で悩んだ。上記のAnsible内でさらにSSH接続しようとしたのもその影響。
* 最終的にまっさらな状態から実行してすべてのワークフローが成功することはもちろん、2回目以降の実行でもエラーにならないような構成にできた。
* 上手くいかないときはエラーコード、というよりログ全体を面倒でもちゃんと確認するべきだった。  
(ansibleのexpectモジュールのデフォルトタイムアウトが30秒だったため、時間が掛かるwebpackerのインストールで途中中断してしまう件はエラーコードの検索では正解にたどり着けなかった。)

## 謝辞
* ウシジマ先生、4か月間お世話になりました！  
最後の講義でもお話ししましたが、あっという間の4か月でした。  
最初は講義に付いていけるか、ちゃんと内容を吸収できるか不安でしたが、最終的にここまでできるようになり、AWSを触るのが苦ではなくなるどころか、楽しくなりました！  
サーバーレスなども勉強しつつ、転職活動の方も頑張ってみます！
