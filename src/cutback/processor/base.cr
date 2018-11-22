abstract class Cutback::Processor::Base

  def self.process(*arguments)
    new(*arguments).process
  end

  abstract def process

end

