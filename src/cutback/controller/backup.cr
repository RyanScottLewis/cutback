class Cutback::Controller::Backup < Cutback::Controller

  actions create, read, update, destroy

  def create
    call(%w[metadata config], "create")
  end

  def read
    puts Generator::BackupTable.generate(@controllers)
  end

  def update
    call(%w[metadata config], "update")
  end

  def destroy
    call(%w[manifest records archive checksum metadata config log], "destroy")
  end

  protected def call(controllers : Array(String), action)
    controllers.each { |controller| call(controller, action) }
  end

end

