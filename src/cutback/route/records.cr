class Cutback::Route::Records < Cutback::Route::Base

  def generate
    execute_generate(records)
  end

  def inspect
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

end

