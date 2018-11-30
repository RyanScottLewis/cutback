class Cutback::Controller::Manifest < Cutback::Controller

  def generate
    command = Command::Find.new(@options, @paths, @tools, @logger, excludes: @options.records, output: @paths.manifest, message: "Generating manifest")

    command.execute
  end

  def inspect
    metadata = Cutback::Metadata::Manifest.new(@paths)

    puts metadata.dump(@options.format)
  end

end

