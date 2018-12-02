class Cutback::Controller::Archive < Cutback::Controller::Resource

  depends_on manifest, records

  protected def create_resource
    run(:archive, message: "Generating archive")
  end

  protected def read_resource
    manifest = Cutback::Metadata::Manifest.new(@paths)
    metadata = Cutback::Metadata::Archive.new(@options, @paths, @tools, manifest)

    puts metadata.dump(@options.format)
  end

end

