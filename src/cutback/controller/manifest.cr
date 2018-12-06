class Cutback::Controller::Manifest < Cutback::Controller::Resource

  protected def create_resource
    run(:find, excludes: @options.records, output: @paths.manifest.to_s, message: "Generating manifest")
  end

  protected def show_metadata
    show_metadata_for(:manifest, @paths)
  end

end

