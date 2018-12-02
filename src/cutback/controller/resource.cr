abstract class Cutback::Controller::Resource < Cutback::Controller

  @@dependencies = [] of String

  macro depends_on(*names)
    @@dependencies = [{{*names.map(&.id.stringify)}}]
  end

  actions create, read, update, destroy

  def create
    create_dependencies
    create_resource if resource_stale?
  end

  def read
    create
    read_resource
  end

  def update
    update_dependencies
    create_resource
  end

  def destroy
    destroy_resource if resource_exists?
  end

  protected def create_resource; end
  protected def read_resource; end

  protected def destroy_resource
    resource_path.delete # TODO: Are you sure? (unless --force)
  end

  def resource_name
    self.class.name
  end

  def resource_path
    @paths[resource_name]
  end

  def resource_exists?
    resource_path.exists?
  end

  protected def dependency_controllers
    @@dependencies.map { |name| @controllers[name].as(Resource) }
  end

  protected def dependency_paths
    @@dependencies.map { |name| @paths[name] }
  end

  protected def create_dependencies
    dependency_controllers.each(&.create)
  end

  protected def update_dependencies
    dependency_controllers.each do |controller|
      controller.update unless controller.resource_exists?
    end
  end

  protected def dependencies_modified?
    dependency_paths.any?(&.modified_after?(resource_path))
  end

  protected def dependencies_stale?
    dependency_controllers.any?(&.resource_stale?)
  end

  def resource_stale?
    @options.force || !resource_exists? || dependencies_modified? || dependencies_stale?
  end

end

