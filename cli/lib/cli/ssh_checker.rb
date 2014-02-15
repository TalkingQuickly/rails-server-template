class SshChecker
  def initialize(host, user)
    @host = host
    @user = user
  end

  def check_can_access
    `ssh -o BatchMode=yes -o StrictHostKeyChecking=no #{@user}@#{@host} 'exit'`
    return $?.success?
  end

  def copy_id
    `ssh-copy-id #{@user}@#{@host}`
  end
end
