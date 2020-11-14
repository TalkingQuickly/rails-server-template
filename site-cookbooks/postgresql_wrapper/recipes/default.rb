#
# Cookbook:: postgresql_wrapper
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

postgresql_client_install 'PostgreSQL Client' do
  setup_repo true
  version '13'
end

postgresql_server_install 'PostgreSQL Server' do
  version '13'
  setup_repo true
  password node['postgresql']['password']['postgres']
end

postgresql_server_conf 'PostgreSQL Config' do
  notifies :reload, 'service[postgresql]'
end