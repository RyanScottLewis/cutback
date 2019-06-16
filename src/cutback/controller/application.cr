class Cutback::Controller::Application < Cutback::Controller

  actions help, version

  delegate definition, to: application

  def help
    puts generate(:help, definition)
  end

  def version
    puts definition.version
  end

end

