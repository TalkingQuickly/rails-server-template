# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Setup resource requirements
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.box = "ubuntu/trusty64"

  # This should match the version specified in your
  # Gemfile
  config.omnibus.chef_version = "11.16.0"

  root_dir = File.dirname(File.expand_path(__FILE__))
  nodes = Dir[File.join(root_dir,'nodes','*.json')]

  nodes.each do |file|
    node_json = JSON.parse(File.read(file))

    if(node_json["vagrant"])

      vagrant_name = node_json["vagrant"]["name"] 
      vagrant_ip = node_json["vagrant"]["ip"]

      config.vm.define vagrant_name do |vagrant|
        vagrant.vm.hostname = vagrant_name
        if vagrant_ip
          vagrant.vm.network :private_network, ip: vagrant_ip
        end

        vagrant.vm.provision "chef_solo" do |chef|
          chef.cookbooks_path = ["berks-cookbooks", "site-cookbooks"]
          chef.data_bags_path = "data_bags"
          chef.roles_path = "roles"
          chef.json = node_json
        end
      end
    end
  end
end
