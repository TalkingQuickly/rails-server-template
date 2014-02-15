require 'thor'
require 'cli/chef_runner'
require 'cli/ssh_checker'

class Cli::CLI < Thor
  desc "test", "do a test"
  def test
    say "Hello world"
    `ssh-copy-id 188.226.144.182`
  end

  desc "provision HOSTNAME",
    "Provision a server from the example node definition"
  option :quiet, default: true, type: :boolean

  def provision(hostname)
    chef = ChefRunner.new(hostname)
    ssh_checker = SshChecker.new(hostname, "root")

    if !ssh_checker.check_can_access && !options[:quiet]
      ssh_checker.copy_id
    end

    if ssh_checker.check_can_access
      say "Can access host, continuing"
      chef.run!
      say "Provisioning Complete, password: #{chef.password}", :green
    else
      say "Cannot access host", :red
    end
  end
end
