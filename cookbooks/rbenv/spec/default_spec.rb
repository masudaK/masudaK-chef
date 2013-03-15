require 'chefspec'

describe 'rbenv::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'rbenv::default' }
  it '"ruby" package should be installed' do
    expect(chef_run).to install_package 'ruby'
#    expect(chef_run).to execute_command 'ruby -v'
  end
end
