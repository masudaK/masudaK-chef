#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2013, Kenichi MASUDA
#
# All rights reserved - Do Not Redistribute
#

install_user_name = node['rbenv']['install_user_name']
git_version = node['git']['version']
platform = node['platform']

# git install 
package "git" do
  version git_version
  action :install
end

git "/home/#{install_user_name}/.rbenv" do
  user install_user_name
  group install_user_name
  repository "https://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
end

# need for clone ruby-build
directory "/home/#{install_user_name}/.rbenv/plugins" do
  user install_user_name
  group install_user_name
  mode 0755
  action :create
  recursive true
end

git "/home/#{install_user_name}/.rbenv/plugins/ruby-build" do
  user install_user_name
  group install_user_name
  repository "https://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
end

# override bashr
template "/home/#{install_user_name}/.bashrc" do
  source "#{platform}-bashrc.erb"
  owner install_user_name
  group install_user_name
  mode "0644"
end
