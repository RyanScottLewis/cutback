class Cutback::Route::Checksum < Cutback::Route::Base

  def generate
    execute_generate(checksum)
  end

  def inspect
    result = Command::Inspect::Checksum.execute(@options, @paths, @logger)
    result = result.split(" ").last

    puts result
  end

end

