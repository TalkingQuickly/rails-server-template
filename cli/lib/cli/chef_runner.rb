require 'securerandom'

class ChefRunner
  def initialize(hostname)
    @hostname = hostname
    @password = SecureRandom.hex
  end

  attr_accessor :password

  # this assumes that the destination server already
  # has the relevant public key on it.
  def run!
    pswd = `openssl passwd -1 "#{@password}"`.delete!("\n")
    node_def = "nodes/#{@hostname}.json"
    user_data = "data_bags/users/deploy.json"
    pub_key = `cat ~/.ssh/id_rsa.pub`.delete!("\n") 

    # create user and node def json files
    `cp nodes/rails_postgres_redis.json.example #{node_def}`
    `cp data_bags/users/deploy.json.example #{user_data}`

    # enter node specific data
    file_text = File.read(node_def)
    File.open(node_def, "w") do |file|
      file.puts(file_text.gsub('POSTGRES_PASSWORD', pswd))
    end

    file_text = File.read(user_data)
    file_text = file_text.gsub('USER_PASSWORD', pswd)
    file_text = file_text.gsub('YOUR_SSH_PUBLIC_KEY', pub_key)
    File.open(user_data, "w") do |file|
      file.puts(file_text)
    end

    `mkdir cookbooks`
    `bundle exec berks install`
    `bundle exec knife solo bootstrap root@#{@hostname}`
  end
end
