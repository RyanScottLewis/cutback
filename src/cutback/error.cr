class Cutback::Error < Exception

  class InvalidExtension < Error; end

  class InvalidIdentifier < Error; end

  class InvalidOutput < Error
    def initialize
      super("Invalid output path")
    end
  end

  class InvalidPaths < Error
    def initialize
      super("Search paths must not be empty")
    end
  end

  class InvalidArguments < Error
    def initialize
      super("Invalid arguments")
    end
  end

  class InvalidFormat < Error
    def initialize
      super("Invalid format")
    end
  end

end

