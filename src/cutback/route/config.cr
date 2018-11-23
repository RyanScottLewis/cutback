class Cutback::Route::Config < Cutback::Route::Base

  def generate
  end

  def inspect
    config = Cutback::Config.new(@options)

    puts config.dump(@options.format)
  end

end

