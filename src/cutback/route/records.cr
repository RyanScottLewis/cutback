class Cutback::Route::Records < Cutback::Route::Base

  def generate
    command = Command::Find.new(@options, @paths, @tools, @logger, includes: @options.records, output: @paths.records)

    command.execute
  end

  def inspect
    metadata = Cutback::Metadata::Records.new(@paths)

    puts metadata.dump(@options.format)
  end

end

