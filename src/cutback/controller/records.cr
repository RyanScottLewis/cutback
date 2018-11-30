class Cutback::Controller::Records < Cutback::Controller

  def generate
    command = Command::Find.new(@options, @paths, @tools, @logger, includes: @options.records, output: @paths.records, message: "Generating records")

    command.execute
  end

  def inspect
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

end

