class Cutback::Controller::Application < Cutback::Controller

  actions help, version

  def help
    puts Generator::Help.generate(@app) # TODO: generate(:help, @app)
  end

  def version
    puts @app.version
  end

end

