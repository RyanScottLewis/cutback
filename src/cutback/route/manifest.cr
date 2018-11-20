class Cutback::Route::Manifest < Cutback::Route

  def generate
    Command::GenerateManifest.execute(@options, @paths)
  end

  def inspect
  end

end

