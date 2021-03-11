#
# Cookbook:: rdr_memcached_wrapper
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

directory '/var/run/memcache/' do
  owner 'memcache'
  group 'memcache'
  mode '0755'
  action :create
end

memcached_instance 'memcached' do
  extra_cli_options ['-P /var/run/memcache/memcached.pid']
end