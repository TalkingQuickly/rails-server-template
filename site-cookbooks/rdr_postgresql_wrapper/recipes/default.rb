#
# Cookbook:: postgresql_wrapper
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

postgresql_client_install 'PostgreSQL Client' do
  setup_repo true
  version node['postgresql']['version']
end

postgresql_server_install 'Install PostgreSQL Server' do
  action :install
  version node['postgresql']['version']
  setup_repo true
end

postgresql_server_install 'Setup PostgreSQL Server' do
  action :create
  version node['postgresql']['version']
  password node['postgresql']['password']['postgres']
end

package 'libpq-dev'

find_resource(:service, 'postgresql') do
  extend PostgresqlCookbook::Helpers
  service_name(lazy { platform_service_name })
  supports restart: true, status: true, reload: true
  action [:enable, :start]
  version node['postgresql']['version']
end

postgresql_server_conf 'PostgreSQL Config' do
  version node['postgresql']['version']
  notifies :reload, 'service[postgresql]'
end