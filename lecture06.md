# 第6回課題

## 最後に AWS を利用した日の記録からイベント名と含まれている内容を3つピックアップ

* イベント名："eventName": "GetBucketPublicAccessBlock",
* イベント時間；"eventTime": "2022-06-18T02:50:03Z",
* イベントソース："eventSource": "s3.amazonaws.com",
* リクエストパラメータ："requestParameters": { 
        "publicAccessBlock": "", 
        "bucketName": "aws-cloudtrail-logs-116380746583-353cd346", 
        "Host": "aws-cloudtrail-logs-116380746583-353cd346.s3.ap-northeast-1.amazonaws.com" 
      },
 
---
## CloudWatchを使ったアラーム
### UnhealthyHostCountが1以上の時にアラーム
* nginxを停止することでアラームが発生し、指定したメールアドレスにアラームメールが飛んできた
![image](https://user-images.githubusercontent.com/32190870/174535006-7b74a8fe-f729-4e3c-9df6-a915fb8ca25c.png)

### HealthyHostCountが1以上の時に通知(OKアクション)
* nginxを再度起動したところ、しばらくして指定したメールアドレスにOKメールが飛んできた
![image](https://user-images.githubusercontent.com/32190870/174535036-1cc8cb89-c8c4-4a33-a3d2-430bf365878e.png)

---
## AWS利用料の見積
https://calculator.aws/#/estimate?id=36d22cdd5025c45e289f737fa4d31e6a4b954403

### 今月の利用料
Cloud9分＋第5回課題でEC2インスタンスからAMI作った影響でEBSで料金が若干発生
![image](https://user-images.githubusercontent.com/32190870/174535071-afb5eb9e-0f02-4708-a532-d15dccfad410.png)

### 先月のEC2利用料
こちらは0円
![image](https://user-images.githubusercontent.com/32190870/174535095-c40dc742-876a-40e5-8cb0-faded6ddf6fc.png)

---
## 感想
* 第5回の課題に比べるとだいぶ易しく感じたが、先週ずっとバタバタしており着手が遅れたのが残念。
* 第5回の課題ではnginxやunicornは使わずに課題提出したが、今回のタイミングで導入してみた。 
nginxの立ち上げはスムーズにできたが、unicornで苦戦。最終的にはsockファイル名の前に.(ドット)が抜けていただけだったが、解決するのに4時間ほど掛かってしまった・・・
しかし環境構築は難しいけどやりがいがあって楽しいと感じた。
