abstract class Generate::App

  property for : Symbol?

  def self.load(path)
    from_yaml(File.read(path))
  end

  def for(value)
    instance = dup
    instance.for = value

    instance
  end

end

