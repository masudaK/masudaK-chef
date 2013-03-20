# See https://github.com/calavera/minitest-chef-handler/blob/master/examples/spec_examples/files/default/tests/minitest/example_test.rb
require 'minitest/spec'

describe 'rbenv' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it 'installs git' do
    package('git').must_be_installed.with(:version, "1.7.1-3.el6_4.1") # minitest-chef-handler
  end
  it "clone rbenv.git" do
    file("/home/vagrant/.rbenv/bin/rbenv").must_exist.with(:owner, "vagrant").and(:group, "vagrant")
  end
  it "Directory .rbenv/plugins" do
    file("/home/vagrant/.rbenv/plugins").must_exist.with(:owner, "vagrant").and(:group, "vagrant").and(:mode, "0755")
  end
  it "clone ruby-build.git" do
    file("/home/vagrant/.rbenv/plugins/ruby-build/bin/ruby-build").must_exist.with(:owner, "vagrant").and(:group, "vagrant")
  end

end
