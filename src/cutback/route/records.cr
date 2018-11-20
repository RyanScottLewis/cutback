class Cutback::Route::Records < Cutback::Route

  def generate
    Command::Generate::Records.execute(@options, @paths)
  end

  def inspect
  end

end

