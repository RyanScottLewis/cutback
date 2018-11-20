class Cutback::Route::Archive < Cutback::Route

  def generate
    Command::Generate::Archive.execute(@options, @paths)
  end

  def inspect
  end

end

