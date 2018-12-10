abstract class Cutback::Processor

  def self.process(*arguments)
    new(*arguments).process
  end

  abstract def process

end

