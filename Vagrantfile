Vagrant.configure("2") do |config|
    config.vm.box = "tom32"
    config.vm.network "private_network", ip: "192.168.33.11"
    config.vm.provision :chef_solo do |chef|
        chef.add_recipe "apache2"
        chef.add_recipe "tomcat"
        chef.add_recipe "mysql"
        chef.json = { :apache => { :default_site_enabled => true } }
    end
    config.vm.provision "shell", inline: "sudo a2enmod proxy_ajp"
    config.vm.provision "shell", inline: "sudo a2enmod proxy_http"
    config.vm.provision "shell", inline: "sudo service apache2 restart"
end
