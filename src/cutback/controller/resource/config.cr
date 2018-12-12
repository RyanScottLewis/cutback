class Cutback::Controller::Resource::Config < Cutback::Controller::Resource

  actions create, read, update, destroy, view

  def view
    config = Cutback::Config.new(@options)

    puts config.dump(@options.format)
  end

  protected def create_resource
    return if @options.dry

    config = Cutback::Config.new(@options)

    config.save(@paths.config, @options.format)
  end

end

