require 'spec_helper'

listen_port = 80

describe port(listen_port) do
  it { should be_listening }
end

# bundlerの指定バージョンがインストールされているか確認
describe command('bundler -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /Bundler version 2\.3\.14/ }
end

# Rubyの指定バージョンがインストールされているか確認
describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 2\.6\.3+/ }
end

# Railsの指定バージョンがインストールされているか確認
describe command('rails -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /Rails 6\.1\.3\.1/ }
end

# nginxの起動確認
describe service('nginx') do
  it { should be_running }
end

# unicornの起動確認
describe service('unicorn') do
  it { should be_running }
end


