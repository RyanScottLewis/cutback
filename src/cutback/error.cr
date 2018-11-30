class Cutback::Error < Exception

  class InvalidIdentifier < Error; end

  class InvalidConfig < Error; end
  class InvalidExtension < InvalidConfig; end

  class InvalidOption < Error; end
  class InvalidOutput < InvalidOption; end
  class InvalidPaths < InvalidOption; end
  class InvalidFormat < InvalidOption; end

  class InvalidArguments < Error; end

  class InvalidController < InvalidArguments; end
  class InvalidAction < InvalidArguments; end

end

