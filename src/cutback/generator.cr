abstract class Cutback::Generator

  def self.generate(*arguments)
    new(*arguments).generate
  end

  abstract def generate

end

