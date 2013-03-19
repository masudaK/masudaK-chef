require 'chefspec'

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

# ==================================================
# MAIN
# ==================================================
describe 'rbenv::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'rbenv::default' }

  describe 'on a RHEL-based box 6.4' do
    let(:runner) do
      ChefSpec::ChefRunner.new do |node|
        node.automatic_attrs['platform'] = 'centos'
        node.automatic_attrs['platform_version'] = '6.4'
      end
    end
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
  end
  # end of describe 'on a RHEL-based box 6.4'

  describe 'on a RHEL-based box 6.2' do
    let(:runner) do
      ChefSpec::ChefRunner.new do |node|
        node.automatic_attrs['platform'] = 'centos'
        node.automatic_attrs['platform_version'] = '6.2'
      end
    end
    describe "Package git" do
      it_behaves_like 'Package', 'git', '1.7.1-3.el6_4.1'
    end
    describe "Directory ruby-build" do
      it_behaves_like 'Directory', '/home/vagrant/.rbenv/plugins', 'vagrant', 'vagrant', 0755
    end
  end # end of describe 'on a RHEL-based box 6.2'

end

