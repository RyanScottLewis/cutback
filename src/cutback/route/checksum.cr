class Cutback::Route::Checksum < Cutback::Route::Base

  def generate
    command = Command::Checksum.new(@options, @paths, @tools, @logger, check: false, message: "Generating checksum")

    command.execute
  end

  def inspect
    command = Command::Checksum.new(@options, @paths, @tools, @logger, check: true, message: "Comparing checksum")

    puts command.execute.split(" ").last
  end

end

