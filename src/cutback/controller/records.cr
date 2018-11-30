class Cutback::Controller::Records < Cutback::Controller::Resource

  def read
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    run(:find, includes: @options.records, output: @paths.records, message: "Generating records")
  end

end

