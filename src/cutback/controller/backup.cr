class Cutback::Controller::Backup < Cutback::Controller

  actions create, read, update, destroy, metadata

  delegate controllers, options, to: application

  def create
    call(%w[metadata config], "create")
  end

  def read
    puts generate(:backup_table, controllers)
  end

  def update
    call(%w[metadata config], "update")
  end

  def destroy
    call(%w[manifest records archive checksum metadata config log], "destroy")
  end

  def metadata
    show_metadata_for(:backup, options)
  end

  protected def call(controllers : Array(String), action)
    controllers.each { |controller| call(controller, action) }
  end

end

