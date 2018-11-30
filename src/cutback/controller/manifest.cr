class Cutback::Controller::Manifest < Cutback::Controller::Resource

  def read
    metadata = Cutback::Metadata::Manifest.new(@paths)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    run(:find, excludes: @options.records, output: @paths.manifest, message: "Generating manifest")
  end

end

