class Cutback::Controller::Manifest < Cutback::Controller::Resource

  protected def read_resource
    metadata = Cutback::Metadata::Manifest.new(@paths)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    run(:find, excludes: @options.records, output: @paths.manifest.to_s, message: "Generating manifest")
  end

end

