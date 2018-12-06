class Cutback::Controller::Resource::Config < Cutback::Controller::Resource

  actions create, read, update, destroy

  protected def create_resource
    config = Cutback::Config.new(@options)

    config.save(@paths.config, @options.format)
  end

end

