class Cutback::Controller::Metadata < Cutback::Controller::Resource

  depends_on checksum
  actions create, read, update, destroy

  protected def create_resource
    save_metadata_for(:root, @options, @paths, @tools)
  end

  protected def show_metadata
    show_metadata_for(:root, @options, @paths, @tools)
  end

end

