class Cutback::Controller::Checksum < Cutback::Controller::Resource

  def read
    puts run(:checksum, check: true, message: "Comparing checksum")
  end

  protected def create_resource
    run(:checksum, check: false, message: "Generating checksum")
  end

end

