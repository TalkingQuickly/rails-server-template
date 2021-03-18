#
# Cookbook:: rdr_memcached_wrapper
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

memcached_instance 'memcached' do
  extra_cli_options ['-P /var/run/memcached/memcached.pid']
  user 'memcache'
end