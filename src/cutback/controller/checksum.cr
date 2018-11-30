class Cutback::Controller::Checksum < Cutback::Controller::Resource

  def read
    command = Command::Checksum.new(@options, @paths, @tools, @logger, check: true, message: "Comparing checksum")

    puts command.execute.split(" ").last
  end

  protected def create_resource
    command = Command::Checksum.new(@options, @paths, @tools, @logger, check: false, message: "Generating checksum")

    command.execute
  end

end

