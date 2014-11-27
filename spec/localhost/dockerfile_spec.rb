require 'spec_helper'

describe 'confd' do
  let(:executable) { file('/usr/local/bin/confd') }

  it 'is installed' do
    expect(executable).to be_file
  end

  it 'is executable by root' do
    expect(executable).to be_executable.by_user('root')
  end

  it 'supports ETCDCTL_PEERS' do
    confd_command = command('ETCDCTL_PEERS=my.ip confd 2>&1 | grep "my.ip"')
    expect(confd_command.exit_status).to eq 0
  end

  it 'has conf.d folder created' do
    expect(file '/etc/confd/conf.d').to be_directory
  end

  it 'has templates folder created' do
    expect(file '/etc/confd/templates').to be_directory
  end
end

describe 'etcd' do
  let(:executable) { file('/usr/local/bin/etcdctl') }

  it 'is installed' do
    expect(executable).to be_file
  end

  it 'is executable by root' do
    expect(executable).to be_executable.by_user('root')
  end
end

describe 'git' do
  it 'is installed' do
    expect(package 'git').to be_installed
  end
end

describe 'golang' do
  it 'is installed' do
    expect(package 'golang').to be_installed
  end
end

