VAGRANTFILE_API_VERSION="2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box="sincerely/trusty64"
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.options = ['--verbose']
    puppet.manifest_file = "base-hadoop.pp"
  end

  config.vm.provision :shell, :path => "provision.sh"

  config.vm.provision "shell", inline: "source /etc/environment"

  config.vm.provision "shell", inline: "cp -f /vagrant/conf/core-site.xml /home/vagrant/hadoop-2.7.0/etc/hadoop/core-site.xml"

  config.vm.provision "shell", inline: "cp -f /vagrant/conf/hdfs-site.xml /home/vagrant/hadoop-2.7.0/etc/hadoop/hdfs-site.xml"

  config.vm.provision "shell", inline: "cp -f /vagrant/conf/hdfs-site.xml /home/vagrant/hadoop-2.7.0/etc/hadoop/yarn-site.xml"

  config.vm.provision "shell", inline: "cp -f /vagrant/conf/hdfs-site.xml /home/vagrant/hadoop-2.7.0/etc/hadoop/mapred-site.xml"

  config.vm.provision "shell", inline: "cp -f /vagrant/conf/hosts /etc/hosts"

  config.vm.define "node1" do |node1|
      node1.vm.network "private_network", ip: "192.168.50.10"

      node1.vm.provision "shell", inline: "$HADOOP_HOME/sbin/hadoop-daemon.sh --script hdfs start namenode"
      node1.vm.provision "shell", inline: "$HADOOP_HOME/sbin/hadoop-daemon.sh --script hdfs start datanode"

      node1.vm.provision "shell", inline: "$HADOOP_HOME/sbin/yarn-daemon.sh start resourcemanager"
      node1.vm.provision "shell", inline: "$HADOOP_HOME/sbin/yarn-daemon.sh start nodemanager"

      node1.vm.provision "shell", inline: "$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver"
  end

  config.vm.define "node2" do |node2|
      node2.vm.network "private_network", ip: "192.168.50.11"

      node2.vm.provision "shell", inline: "$HADOOP_HOME/sbin/hadoop-daemon.sh --script hdfs start datanode"
      node2.vm.provision "shell", inline: "$HADOOP_HOME/sbin/yarn-daemon.sh start nodemanager"
  end

  config.vm.define "node3" do |node3|
      node3.vm.network "private_network", ip: "192.168.50.12"

      node3.vm.provision "shell", inline: "$HADOOP_HOME/sbin/hadoop-daemon.sh --script hdfs start datanode"
      node3.vm.provision "shell", inline: "$HADOOP_HOME/sbin/yarn-daemon.sh start nodemanager"
  end
end