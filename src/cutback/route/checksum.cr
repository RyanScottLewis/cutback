class Cutback::Route::Checksum < Cutback::Route

  def generate
    Command::Generate::Checksum.execute(@options, @paths)
  end

  def inspect
  end

end

