class Cutback::Options

  class Prototype

    include Helpers::Options::Properties::Prototype

  end

  include Helpers::Options::Properties::Base
  include Helpers::Options::Updatable(Prototype)
  include Helpers::Options::Updatable(Config)

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def process
    Processor::Options.process(@arguments, self)
  end

  def validate
    Validator::Options.validate(self)
  end

end

