require 'chefspec'

describe 'rbenv::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'rbenv::default' }
#  it 'should be cloned' do
#    # TODO below change test way for scm resources
#    expect(chef_run).to create_directory "/home/masuda_kenichi/.rbenv"
#  end

  it 'should create ruby-build dir' do
    chef_run.should create_directory '/home/masuda_kenichi/.rbenv/plugins'
    chef_run.directory('/home/masuda_kenichi/.rbenv/plugins').should be_owned_by('masuda_kenichi', 'masuda_kenichi')
    chef_run.directory('/home/masuda_kenichi/.rbenv/plugins').mode.should == 0755
  end

#  it 'should be cloned' do
#    # TODO below change test way for scm resources
#    expect(chef_run).to create_directory "/home/masuda_kenichi/.rbenv"
#  end
end
