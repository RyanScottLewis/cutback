class Cutback::Controller::Config < Cutback::Controller::Resource

  def read
    config = Cutback::Config.new(@options)

    puts config.dump(@options.format)
  end

  protected def create_resource
    # TODO
  end

end

