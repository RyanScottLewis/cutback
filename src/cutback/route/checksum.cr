class Cutback::Route::Checksum < Cutback::Route

  def generate
    Command::Generate::Checksum.execute(@options, @paths)
  end

  def inspect
    result = Command::Inspect::Checksum.execute(@options, @paths)
    result = result.split(" ").last

    puts result
  end

end

