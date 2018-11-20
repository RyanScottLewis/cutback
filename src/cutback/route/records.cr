class Cutback::Route::Records < Cutback::Route

  def generate
    Command::GenerateRecords.execute(@options, @paths)
  end

  def inspect
  end

end

