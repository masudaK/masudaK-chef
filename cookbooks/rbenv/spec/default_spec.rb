require 'chefspec'

describe 'rbenv::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'rbenv::default' }
  it 'should install git package' do
    expect(chef_run).to install_package 'git'
  end
#  it 'should be cloned' do
#    # TODO below change test way for scm resources
#    expect(chef_run).to create_directory "/home/vagrant/.rbenv"
#  end

  it 'should create ruby-build dir' do
    chef_run.should create_directory '/home/vagrant/.rbenv/plugins'
    chef_run.directory('/home/vagrant/.rbenv/plugins').should be_owned_by('vagrant', 'vagrant')
    chef_run.directory('/home/vagrant/.rbenv/plugins').mode.should == 0755
  end

#  it 'should be cloned' do
#    # TODO below change test way for scm resources
#    expect(chef_run).to create_directory "/home/vagrant/.rbenv"
#  end
end
