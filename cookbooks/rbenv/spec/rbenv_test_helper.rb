module RbenvTestHelper
  def self.it_should_install_package_at_version(package, version)
    expect(chef_run).to install_package_at_version "#{package}","#{version}"
  end

  def self.it_should_create_dir_extra(path,user,group,mode)
    chef_run.should create_directory "#{path}"
    chef_run.directory("#{path}").should be_owned_by("#{user}", "#{group}")
    chef_run.directory("#{path}").mode.should == mode
  end
end

