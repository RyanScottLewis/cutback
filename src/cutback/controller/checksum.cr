class Cutback::Controller::Checksum < Cutback::Controller::Resource

  depends_on archive
  actions create, read, update, destroy, verify

  def verify
    puts run(:checksum, check: true, message: "Verifying checksum")
  end

  protected def create_resource
    run(:checksum, check: false, message: "Generating checksum")
  end

end

