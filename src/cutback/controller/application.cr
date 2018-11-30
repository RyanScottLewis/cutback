class Cutback::Controller::Application < Cutback::Controller

  actions create, help, version

  def create
    #@controllers["backup"].create

    @controllers["manifest"].create
    @controllers["records"].create
    @controllers["archive"].create
    @controllers["checksum"].create
    @controllers["metadata"].create
  end

  def help
    puts Embed["help"]
  end

  def version
    puts Embed["version"]
  end

end

