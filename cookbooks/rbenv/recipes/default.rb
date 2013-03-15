#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2013, Kenichi MASUDA
#
# All rights reserved - Do Not Redistribute
#

owner_name = 'masuda_kenichi'

git "/home/#{owner_name}/.rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  not_if "test -d /home/#{owner_name}/.rbenv"
end

directory "/home/#{owner_name}/.rbenv/plugins" do
  user "#{owner_name}"
  group "#{owner_name}"
  mode 0755
  action :create
end

git "/home/#{owner_name}/.rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  not_if "test -d /home/#{owner_name}/.rbenv/plugins/ruby-build"
end
