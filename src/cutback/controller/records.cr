class Cutback::Controller::Records < Cutback::Controller::Resource

  def read
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    command = Command::Find.new(@options, @paths, @tools, @logger, includes: @options.records, output: @paths.records, message: "Generating records")

    command.execute
  end

end

