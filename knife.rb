local_mode true
chef_repo_path   File.expand_path('../' , __FILE__)
cookbook_path ["cookbooks", "berks-cookbooks", "site-cookbooks"]

knife[:ssh_attribute] = "knife_zero.host"
knife[:use_sudo] = true
knife[:editor] = 'vim'
knife[:before_bootstrap] = "rm -rf ./berks-cookboks/* && berks vendor"
knife[:before_converge]  = "rm -rf ./berks-cookboks/* && berks vendor"
