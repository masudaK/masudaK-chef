default['rbenv']['install_user_name'] = 'vagrant'

case node['platform']
when "centos"
  default['git']['version'] = '1.7.1-3.el6_4.1'
when "ubuntu"
  default['git']['version'] = '1:1.7.10.4-1ubuntu1'
else
  default['git']['version'] = ''
end
