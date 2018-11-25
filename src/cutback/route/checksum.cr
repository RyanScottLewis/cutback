class Cutback::Route::Checksum < Cutback::Route::Base

  def generate
    command = Command::Checksum.new(@options, @paths, @tools, @logger, check: false)

    command.execute
  end

  def inspect
    command = Command::Checksum.new(@options, @paths, @tools, @logger, check: true)

    puts command.execute.split(" ").last
  end

end

