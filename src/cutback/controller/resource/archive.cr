class Cutback::Controller::Resource::Archive < Cutback::Controller::Resource

  depends_on manifest, records

  delegate options, paths, tools, to: application

  protected def create_resource
    run(:archive, message: "Generating archive")
  end

  protected def show_metadata
    show_metadata_for(:archive, options, paths, tools)
  end

end

