# See https://github.com/calavera/minitest-chef-handler/blob/master/examples/spec_examples/files/default/tests/minitest/example_test.rb
require 'minitest/spec'

describe 'rbenv' do
#  require 'chef/mixin/shell_out'
#  include Chef::Mixin::ShellOut
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources


   it 'installs git' do
     package('git').must_be_installed.with(:version, "1.7.1-3.el6_4.1") # minitest-chef-handler
   end
   it "Directory dir" do
     file("/home/vagrant/.rbenv/plugins").must_exist.with(:owner, "vagrant").and(:group, "vagrant").and(:mode, "0755")
   end

end
