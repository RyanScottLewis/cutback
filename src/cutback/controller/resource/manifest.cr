class Cutback::Controller::Resource::Manifest < Cutback::Controller::Resource

  delegate options, paths, to: application

  protected def create_resource
    run(:find, excludes: options.records, output: paths.manifest.to_s, message: "Generating manifest")
  end

  protected def show_metadata
    show_metadata_for(:manifest, paths)
  end

end

