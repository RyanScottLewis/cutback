class Cutback::Route::Manifest < Cutback::Route

  def generate
    Command::Generate::Manifest.execute(@options, @paths)
  end

  def inspect
  end

end

