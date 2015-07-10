Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.5"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=777','fmode=755']
  config.vm.provision :shell, :path => "provision.sh"
end
