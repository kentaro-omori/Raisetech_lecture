require 'spec_helper'

listen_port = 80

describe port(listen_port) do
  it { should be_listening }
end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end
describe port(3306) do
  it { should be_listening }
end
