class Cutback::Controller::Application < Cutback::Controller

  actions help, version

  def help
    puts Embed["help"]
  end

  def version
    puts Embed["version"]
  end

end

