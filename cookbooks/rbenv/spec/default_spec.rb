require 'chefspec'

# ==================================================
# HELPER
# ==================================================
module RbenvTestHelper
  def it_should_install_package_at_version(package, version)
    expect(chef_run).to install_package_at_version "#{package}","#{version}"
  end
  
  def it_should_create_dir_extra(path,user,group,mode)
    chef_run.should create_directory "#{path}"
    chef_run.directory("#{path}").should be_owned_by("#{user}", "#{group}")
    chef_run.directory("#{path}").mode.should == mode
  end
end

# ==================================================
# MAIN
# ==================================================
describe 'rbenv::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'rbenv::default' }
  include RbenvTestHelper

  describe 'on a RHEL-based box 6.4' do
    let(:runner) do
      ChefSpec::ChefRunner.new do |node|
        node.automatic_attrs[:platform] = 'centos'
        node.automatic_attrs[:platform_version] = '6.4'
      end
    end
    it 'should install git package' do
      it_should_install_package_at_version('git','1.7.1-3.el6_4.1')
    end
    #end
    #it 'should be cloned' do
    #  # TODO below change test way for scm resources
    #  expect(chef_run).to create_directory "/home/vagrant/.rbenv"
    #end
    it 'should create ruby-build dir' do
      it_should_create_dir_extra('/home/vagrant/.rbenv/plugins','vagrant','vagrant',0755)
    end
    #it 'should be cloned' do
    #  # TODO below change test way for scm resources
    #  expect(chef_run).to create_directory "/home/vagrant/.rbenv"
    #end
  end
  # end of describe 'on a RHEL-based box 6.4'

  describe 'on a RHEL-based box 6.2' do
    let(:runner) do
      ChefSpec::ChefRunner.new do |node|
        node.automatic_attrs[:platform] = 'centos'
        node.automatic_attrs[:platform_version] = '6.2'
      end
    end
    it 'should install git package' do
      it_should_install_package_at_version('git','1.7.1-3.el6_4.1')
    end
    it 'should create ruby-build dir' do
      it_should_create_dir_extra('/home/vagrant/.rbenv/plugins','vagrant','vagrant',0755)
    end
  end # end of describe 'on a RHEL-based box 6.2'

end


