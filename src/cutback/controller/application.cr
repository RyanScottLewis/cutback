class Cutback::Controller::Application < Cutback::Controller

  actions help, version

  def help
    puts generate(:help, @app)
  end

  def version
    puts @app.version
  end

end

