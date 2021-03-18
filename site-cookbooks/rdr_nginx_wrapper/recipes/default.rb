#
# Cookbook:: nginx_wrapper
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

nginx_install 'default' do
  source 'repo'
end

nginx_service 'nginx' do
  config_test true
  action :enable
  delayed_action :start
end

nginx_config 'nginx' do
  action :create
  conf_cookbook 'rdr_nginx_wrapper'
  conf_template 'nginx.conf.erb'
  default_site_enabled true
  notifies :reload, 'nginx_service[nginx]', :delayed
end

directory '/etc/nginx/sites-available/' do
  action :create
end

directory '/etc/nginx/sites-enabled/' do
  action :create
end
