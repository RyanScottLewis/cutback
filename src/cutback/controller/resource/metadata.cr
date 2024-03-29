class Cutback::Controller::Resource::Metadata < Cutback::Controller::Resource

  depends_on checksum

  actions create, read, update, destroy

  delegate options, paths, tools, to: application

  protected def create_resource
    save_metadata_for(:root, options, paths, tools)
  end

end

