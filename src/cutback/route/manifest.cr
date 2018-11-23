class Cutback::Route::Manifest < Cutback::Route::Base

  def generate
    execute_generate(manifest)
  end

  def inspect
    metadata = Cutback::Metadata::Manifest.new(@paths)

    puts metadata.dump(@options.format)
  end

end

