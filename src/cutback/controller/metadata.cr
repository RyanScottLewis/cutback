class Cutback::Controller::Metadata < Cutback::Controller::Resource

  def create
    return if @options.dry

    metadata = create_metadata

    metadata.save(@paths.metadata, @options.format)
  end

  def read
    return if @options.dry

    metadata = create_metadata

    puts metadata.dump(@options.format)
  end

  protected def create_metadata
    Cutback::Metadata::Root.new(@options, @paths, @tools)
  end

end

