#
# Cookbook:: rdr_redisio_wrapper
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

apt_repository 'redis' do
  uri 'ppa:redislabs/redis'
end

apt_update 'update'

redisio_install "redis" do
end