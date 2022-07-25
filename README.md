# lecture11 ServerSpecのテスト実施

## 使用環境
* lecture6までに作成していた環境を使用

## テスト結果
```		
[ec2-user@ip-10-0-131-19 serverspec]$ bundle exec rake spec
		/home/ec2-user/.rbenv/versions/2.6.3/bin/ruby -I/home/ec2-user/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/rspec-core-3.11.0/lib:/home/ec2-user/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/rspec-support-3.11.0/lib /home/ec2-user/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/rspec-core-3.11.0/exe/rspec --pattern spec/localhost/\*_spec.rb
		
		Package "rails"
		  is expected to be installed by "gem" with version "6.1.3.1"
		
		Package "nginx"
		  is expected to be installed
		
		Service "nginx"
		  is expected to be enabled
		  is expected to be running
		
		Package "unicorn"
		  is expected to be installed by "gem"
		
		Port "80"
		  is expected to be listening
		
		Service "mysqld"
		  is expected to be enabled
		  is expected to be running
		
		Port "3306"
		  is expected to be listening
		
		Command "curl http://127.0.0.1:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s"
		  stdout
		    is expected to match /^200$/
		
		Finished in 0.74973 seconds (files took 0.44361 seconds to load)
		10 examples, 0 failures
```

## 感想&学び
* 最初やった時にnginxのenabledがエラーになった。runningなのになぜ？と思ったが、enabledは自動起動設定をしているかどうかのことだった。
* ServerSpecもテスト項目に変数を使ったり、複数パッケージがインストールされていることを一括で確認する方法もあるようなので、その辺りも学んでいきたい。
* 抜け漏れのないテストをするために、やはり事前にテスト項目を挙げておくことが重要と感じた。