#
# Cookbook:: ruby_rbenv_wrapper
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

rbenv_system_install 'system'

node['rbenv']['rubies'].each do |ruby|
  rbenv_ruby ruby
end

node['rbenv']['gems'].each do |version, gems|
  gems.each do |the_gem|
    rbenv_gem the_gem['name'] do
      rbenv_version version
    end
  end
end

rbenv_global node['rbenv']['rubies'].first