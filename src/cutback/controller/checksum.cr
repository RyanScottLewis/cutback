class Cutback::Controller::Checksum < Cutback::Controller::Resource

  depends_on archive

  protected def read_resource
    puts run(:checksum, check: true, message: "Comparing checksum")
  end

  protected def create_resource
    run(:checksum, check: false, message: "Generating checksum")
  end

end

