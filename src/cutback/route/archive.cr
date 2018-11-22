class Cutback::Route::Archive < Cutback::Route::Base

  def generate
    Command::Generate::Archive.execute(@options, @paths)
  end

  def inspect
    manifest = Cutback::Metadata::Manifest.new(@paths)
    metadata = Cutback::Metadata::Archive.new(@options, @paths, manifest)

    puts metadata.dump(@options.format)
  end

end

