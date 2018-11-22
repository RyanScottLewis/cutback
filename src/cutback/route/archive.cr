class Cutback::Route::Archive < Cutback::Route::Base

  def generate
    Command::Generate::Archive.execute(@options, @paths)
  end

  def inspect
  end

end

