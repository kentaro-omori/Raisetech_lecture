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
(画像) 

### HealthyHostCountが1以上の時に通知(OKアクション)
* nginxを再度起動したところ、しばらくして指定したメールアドレスにOKメールが飛んできた
(画像) 
---
## AWS利用料の見積
https://calculator.aws/#/estimate?id=36d22cdd5025c45e289f737fa4d31e6a4b954403

### 今月の利用料
Cloud9分＋第5回課題でEC2インスタンスからAMI作った影響でEBSで料金が若干発生
(画像)

### 先月のEC2利用料
こちらは0円
(画像)