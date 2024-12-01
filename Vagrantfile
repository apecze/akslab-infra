Vagrant.configure("2") do |config|
  servers=[
      {
        :hostname => "k8s-node-1",
        :box => "bento/ubuntu-22.04",
        :ip => "10.10.72.23",
        :ssh_port => '7252',
        :cpu => '2',
        :memory => '4096',
      },
      {
        :hostname => "ansible",
        :box => "bento/ubuntu-22.04",
        :ip => "10.10.72.22",
        :ssh_port => '7253',
        :cpu => '2',
        :memory => '2048',
      }
    ]

  servers.each do |machine|
      config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network :public_network, ip: machine[:ip], bridge: 'Intel(R) Ethernet Connection (7) I219-V'
            node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
            node.vm.provider :virtualbox do |vb|
            case node.vm.hostname
            when "k8s-node-1"
                node.vm.provision "shell", path: "scripts/config_simplejson.sh"
            when "ansible"
                node.vm.provision "shell", path: "scripts/config_ansible.sh"
                node.vm.provision "shell", path: "scripts/terraform_install.sh"
                node.vm.provision "shell", path: "scripts/run-playbooks.sh"
            end
      end
    end
  end
end
