class Cutback::Route::Manifest < Cutback::Route::Base

  def generate
    Command::Generate::Manifest.execute(@options, @paths)
  end

  def inspect
    metadata = Cutback::Metadata::Manifest.new(@paths)

    puts metadata.dump(@options.format)
  end

end

