class Cutback::Controller::Application < Cutback::Controller

  actions create, help, version

  def create
    # TODO: Something like
    #@controllers["backup"].create
    # Or
    #redirect_to "backup#create"
  end

  def help
    puts HELP
  end

  def version
    puts VERSION
  end

end

