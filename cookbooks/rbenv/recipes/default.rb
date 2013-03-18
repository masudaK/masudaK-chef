#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2013, Kenichi MASUDA
#
# All rights reserved - Do Not Redistribute
#

install_user_name = node["rbenv"]["install_user_name"]

# git install
package "git" do
  action :install
end

git "/home/#{install_user_name}/.rbenv" do
  user install_user_name
  group install_user_name
  repository "https://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
end

# 必要なディレクトリ作成
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

