class Cutback::Controller::Application < Cutback::Controller

  actions help, version

  def help
    puts generate(:help, @definition)
  end

  def version
    puts @definition.version
  end

end

