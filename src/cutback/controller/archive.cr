class Cutback::Controller::Archive < Cutback::Controller::Resource

  protected def read_resource
    manifest = Cutback::Metadata::Manifest.new(@paths)
    metadata = Cutback::Metadata::Archive.new(@options, @paths, @tools, manifest)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    call("manifest#create")
    call("records#create")

    run(:archive, message: "Generating archive")
  end

  protected def resource_should_update?
    super ||
      @paths.manifest.modified_after?(@paths.archive) ||
      @paths.records.modified_after?(@paths.archive)
  end

end

