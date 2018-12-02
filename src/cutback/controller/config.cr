class Cutback::Controller::Config < Cutback::Controller::Resource

  protected def create_resource
    create_config.save(@paths.config, @options.format)
  end

  protected def read_resource
    puts create_config.dump(@options.format)
  end

  protected def create_config
    Cutback::Config.new(@options)
  end

end

