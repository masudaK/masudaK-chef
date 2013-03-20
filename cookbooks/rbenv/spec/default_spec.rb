require 'chefspec'
require 'fauxhai'

# ==================================================
# shared_exaples
# ==================================================
shared_examples 'Package' do |package_name, package_version|
  context 'when install' do
    it { expect(chef_run).to install_package_at_version "#{package_name}","#{package_version}" }
  end
end

shared_examples 'Directory' do |dir_path, dir_owner, dir_group, dir_mode|
  context 'when create' do
    it { chef_run.should create_directory "#{dir_path}" }
    it { chef_run.directory("#{dir_path}").should be_owned_by("#{dir_owner}", "#{dir_group}") }
    it { chef_run.directory("#{dir_path}").mode.should == dir_mode }
  end
end

shared_examples 'Template' do |file_path, match_char|
  context 'when create' do
    it { expect(chef_run).to create_file_with_content "#{file_path}","#{match_char}" }
  end
end
# ==================================================
# MAIN
# ==================================================
describe 'rbenv::default' do

  describe 'on a CentOS box' do
    # set platform
    let(:chef_run) {
      runner = ChefSpec::ChefRunner.new()
      runner.node.automatic_attrs['platform'] = 'centos'
      runner.converge 'rbenv::default'
      runner
    }
    describe "Package git" do
      it_behaves_like 'Package', 'git', '1.7.1-3.el6_4.1'
    end
    #it 'should be cloned' do
    #  # TODO below change test way for scm resources
    #  expect(chef_run).to create_directory "/home/vagrant/.rbenv"
    #end
    describe "Directory ruby-build" do
      it_behaves_like 'Directory', '/home/vagrant/.rbenv/plugins', 'vagrant', 'vagrant', 0755
    end
    #it 'should be cloned' do
    #  # TODO below change test way for scm resources
    #  expect(chef_run).to create_directory "/home/vagrant/.rbenv"
    #end
    describe "Template .bashrc" do
      it_behaves_like 'Template', '/home/vagrant/.bashrc', 'rbenv'
    end
  end
  # end of describe 'on a CentOS box'

  describe 'on a Ubuntu box' do
    # set platform
    let(:chef_run) {
      runner = ChefSpec::ChefRunner.new()
      runner.node.automatic_attrs['platform'] = 'ubuntu'
      runner.converge 'rbenv::default'
      runner
    }
    #before do
    #  Fauxhai.mock(platform:'ubuntu')
    #end
    describe "Package git" do
      it_behaves_like 'Package', 'git', '1:1.7.10.4-1ubuntu1'
    end
    describe "Directory ruby-build" do
      it_behaves_like 'Directory', '/home/vagrant/.rbenv/plugins', 'vagrant', 'vagrant', 0755
    end
    describe "Template .bashrc" do
      it_behaves_like 'Template', '/home/vagrant/.bashrc', 'rbenv'
    end
  end # end of describe 'on a Ubuntu box'

end

