class Cutback::Route::Config < Cutback::Route::Base

  def generate
    inspect
  end

  def inspect
    config = Cutback::Config.new(@options)

    puts config.dump(@options.format)
  end

end

