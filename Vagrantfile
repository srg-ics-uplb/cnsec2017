Vagrant.configure("2") do |config|
   config.vm.box = "ubuntu/xenial64"
   config.vm.network "forwarded_port", guest: 80, host: 8080
   config.vm.define :cnsec2017 do |cnsec2017|
      cnsec2017.vm.provider :virtualbox do |v|
         v.name = "cnsec2017"
         v.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1]
      end
      cnsec2017.vm.network :public_network
      cnsec2017.vm.hostname = "cnsec2017"
      cnsec2017.vm.provision :shell, :path => "setup-env.sh"
   end
end
