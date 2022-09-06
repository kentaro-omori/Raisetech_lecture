# lecture14
- CircleCIで下記のWorkflowを実行するサンプルリポジトリ

## Workflow
1. リポジトリにコードをpush
2. CircleCIがリポジトリにpushされたことをイベントトリガーとして、workflowを実行
3. 最初のworkflowとしてCloudFormationを実行
4. 2番目のworkflowとしてCloudFormationによって作成されたAWS環境に対して、ansibleを実行
5. 3番目のworkflowとしてServerspecで自動テストを実行する

## 実行環境
### aws cli
```
```

### ansible
```
ansible [core 2.12.7]
```

### Serverspec
```

```

### ruby
```

```