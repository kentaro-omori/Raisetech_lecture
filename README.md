# lecture13 CircleCIにAnsibleとServerspecの処理を追加

## CircleCI上で設定した環境変数
![image](https://user-images.githubusercontent.com/32190870/188421398-7790c932-0d72-4b01-8b4d-50ec5ce6db4e.png)
* ANSIBLE_HOST_KEY_CHECKING：SSH初回接続時の確認回避用
* ANSIBLE_INVENTORY：Inventoryをbase64エンコードしたもの
* ANSIBLE_SSH_KEY：Ansibleで試用するSSHプライベートキーをbase64エンコードしたもの
* HOST_NAME：Serverspecのターゲットホスト名
* USER_NAME：Serverspecのターゲットホストのユーザー名
* AWS_ACCESS_KEY_ID：AWS CLI用(最終課題用。今回の課題では未使用)
* AWS_DEFAULT_REGION：AWS CLI用(最終課題用。今回の課題では未使用)
* AWS_SECRET_ACCESS_KEY：AWS CLI用(最終課題用。今回の課題では未使用)

別途Additional SSH KeysでEC2接続用のSSHプライベートキーを登録した。

---

## 結果
![image](https://user-images.githubusercontent.com/32190870/188421558-eb5230bd-78ed-4420-9e0c-3599ba682e65.png)

### Ansible実行結果(最後のログのみ抜粋)
```
PLAY [web] *********************************************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host ************* is using the discovered Python
interpreter at /usr/bin/python3.7, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.13/reference_appendices/interpreter_discovery.html for more information.
ok: [*************]

TASK [ls] **********************************************************************
changed: [*************]

TASK [result_ls] ***************************************************************
ok: [*************] => {
    "msg": "Raisetech_lecture\nserverspec\nsrc"
}

TASK [installed git] ***********************************************************
ok: [*************]

PLAY RECAP *********************************************************************
*************              : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0
```

### Serverspec実行結果(最後のログのみ抜粋)
```
/usr/local/bin/ruby -I/home/circleci/.rubygems/gems/rspec-support-3.11.0/lib:/home/circleci/.rubygems/gems/rspec-core-3.11.0/lib /home/circleci/.rubygems/gems/rspec-core-3.11.0/exe/rspec --pattern spec/ec2_server/\*_spec.rb
.......

Finished in 9.39 seconds (files took 0.48277 seconds to load)
7 examples, 0 failures
```

---

## 感想&学び
* CircleCIとAnsibleの連携はスムーズに出来たが、CircleCIとServerspecの連携にかなり苦戦した。
* ローカルからリモートEC2へSSH経由でServerspecによるテスト実施までは良かったが、CircleCIのコンテナ上でServerspecを動かすときのターゲットホストの指定方法が分からずかなり悩んだ。  
(調べ方の問題もあると思うが、ピンポイントの情報にはたどり着けなかった)  
ただその分かなり調べたり自分の手を動かしたので、勉強になった。  
(CircleCIのFailedを知らせるメールは大量に来たがｗ)
* 一通りの連携が出来たので、ホスト名やユーザー名、SSHフットプリントをハードコーディングしないで済むように変更した。大分中身がすっきりした感じがする。
* 今回はAnsible/Serverspecともに最低限の内容しか記載していないので、Cfnでのインフラ構築含めて最終課題で補完していきたい。
