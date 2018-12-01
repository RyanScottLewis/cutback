class Cutback::Controller::Backup < Cutback::Controller

  actions create

  def create
    @controllers["manifest"].execute("create")
    @controllers["records"].execute("create")
    @controllers["archive"].execute("create")
    @controllers["checksum"].execute("create")
    @controllers["metadata"].execute("create")
  end

end

