class Cutback::Controller::Metadata < Cutback::Controller::Resource

  depends_on checksum

  protected def create_resource
    create_metadata.save(@paths.metadata, @options.format)
  end

  protected def read_resource
    puts create_metadata.dump(@options.format)
  end

  protected def create_metadata
    Cutback::Metadata::Root.new(@options, @paths, @tools)
  end

end

