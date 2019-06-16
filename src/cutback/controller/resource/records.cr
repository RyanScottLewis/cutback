class Cutback::Controller::Resource::Records < Cutback::Controller::Resource

  delegate options, paths, to: application

  protected def create_resource
    run(:find, includes: options.records, output: paths.records.to_s, message: "Generating records")
  end

  protected def show_metadata
    show_metadata_for(:records, paths)
  end

end

