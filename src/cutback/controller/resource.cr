abstract class Cutback::Controller::Resource < Cutback::Controller

  actions create, read

  protected abstract def create_resource
  protected abstract def read_resource

  def create
    if resource_should_update?
      create_resource
    else
      @logger.warn("Resource '%s' for %s already exists: %s" % [resource_name, @identifier, resource_path])
    end
  end

  def read
    create_resource if resource_should_update?

    read_resource
  end

  protected def resource_name
    self.class.name
  end

  protected def resource_path
    @paths[resource_name]
  end

  protected def resource_exists?
    resource_path.exists?
  end

  protected def resource_should_update?
    @options.force || !resource_exists?
  end

end

