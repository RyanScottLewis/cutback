class Cutback::Route::Records < Cutback::Route::Base

  def generate
    Command::Generate::Records.execute(@options, @paths)
  end

  def inspect
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

end

