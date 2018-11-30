abstract class Cutback::Controller::Resource < Cutback::Controller

  actions create, read

  def create
    if resource_exists?
      @logger.warn("Resource '%s' for %s already exists: %s" % [resource_name, @identifier, resource_path])
    else
      create_resource
    end
  end

  protected def resource_name
    self.class.name
  end

  protected def resource_path
    @paths[resource_name]
  end

  protected abstract def create_resource

  protected def resource_exists?
    File.exists?(resource_path)
  end

end

