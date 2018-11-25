class Cutback::Route::Archive < Cutback::Route::Base

  def generate
    command = Command::Archive.new(@options, @paths, @tools, @logger)

    command.execute
  end

  def inspect
    manifest = Cutback::Metadata::Manifest.new(@paths)
    metadata = Cutback::Metadata::Archive.new(@options, @paths, @tools, manifest)

    puts metadata.dump(@options.format)
  end

end

