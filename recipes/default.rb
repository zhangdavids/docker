case node['platform']
when 'ubuntu'
  include_recipe 'apt'
  package 'apt-transport-https'
  package 'bsdtar'
  include_recipe 'lxc'
  include_recipe 'docker::aufs'
end

if node['docker']['install_type'] == 'source'
  node.set['go']['version'] = '1.1'
  include_recipe 'golang'
  include_recipe 'git'
end

include_recipe "docker::#{node['docker']['install_type']}"
include_recipe "docker::#{node['docker']['init_type']}"
