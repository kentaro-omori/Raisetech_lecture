require 'spec_helper'

listen_port = 80

# describe package('rails') do
# #  it { should be_installed.with_version('2.6.3') }
#   it { should be_installed.by('gem').with_version('6.1.3.1') }
# end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

# describe package('unicorn') do
#   it { should be_installed.by('gem') }
# end

describe port(listen_port) do
  it { should be_listening }
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end
