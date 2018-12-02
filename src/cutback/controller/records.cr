class Cutback::Controller::Records < Cutback::Controller::Resource

  protected def read_resource
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    run(:find, includes: @options.records, output: @paths.records.to_s, message: "Generating records")
  end

end

