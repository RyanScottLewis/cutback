class Cutback::Options

  class Prototype

    include Helpers::Options::Properties::Prototype

  end

  include Helpers::Options::Properties::Base
  include Helpers::Options::Updatable(Prototype)
  include Helpers::Options::Updatable(Config)

end

