class Cutback::Controller::Config < Cutback::Controller

  def inspect
    config = Cutback::Config.new(@options)

    puts config.dump(@options.format)
  end

end

