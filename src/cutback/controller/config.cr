class Cutback::Controller::Config < Cutback::Controller::Resource

  def read
    config = Cutback::Config.new(@options)

    puts config.dump(@options.format)
  end

end

