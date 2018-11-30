class Cutback::Controller::Manifest < Cutback::Controller::Resource

  def read
    metadata = Cutback::Metadata::Manifest.new(@paths)

    puts metadata.dump(@options.format)
  end

  protected def create_resource
    command = Command::Find.new(@options, @paths, @tools, @logger, excludes: @options.records, output: @paths.manifest, message: "Generating manifest")

    command.execute
  end

end

