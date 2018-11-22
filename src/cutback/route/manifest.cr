class Cutback::Route::Manifest < Cutback::Route::Base

  def generate
    Command::Generate::Manifest.execute(@options, @paths)
  end

  def inspect
  end

end

