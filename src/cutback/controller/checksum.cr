class Cutback::Controller::Checksum < Cutback::Controller::Resource

  protected def read_resource
    puts run(:checksum, check: true, message: "Comparing checksum")
  end

  protected def create_resource
    call("archive#create")
    run(:checksum, check: false, message: "Generating checksum")
  end

  protected def resource_should_update?
    super ||
      @paths.archive.modified_after?(@paths.checksum)
  end

end

