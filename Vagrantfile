# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  guest_ips = {
    development: '192.168.102.10',
    test: '192.168.102.20'
  }

  guest_ips.keys.each do |environment|
    config.vm.define environment do |config|
      config.vm.box = 'rails'
      config.vm.box_url = 'http://s3.amazonaws.com/sandbender-boxes/rails.box'
      config.vm.network :private_network, ip: guest_ips[environment]
    end
  end
end
