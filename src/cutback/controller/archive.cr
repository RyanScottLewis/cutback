class Cutback::Controller::Archive < Cutback::Controller::Resource

  def read
    manifest = Cutback::Metadata::Manifest.new(@paths)
    metadata = Cutback::Metadata::Archive.new(@options, @paths, @tools, manifest)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    command = Command::Archive.new(@options, @paths, @tools, @logger, message: "Generating archive")

    command.execute
  end

end

