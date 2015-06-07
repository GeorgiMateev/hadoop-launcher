VAGRANTFILE_API_VERSION="2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box="sincerely/trusty64"
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.options = ['--verbose']
    puppet.manifest_file = "base-hadoop.pp"
   end
  config.vm.define :setVars do |setVars|
    setVars.vm.provision :shell, :path => "provision.sh"
   end
  config.vm.provision "shell", inline: "source /etc/environment"
end