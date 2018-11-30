abstract class Cutback::Validator

  def self.validate(*arguments)
    new(*arguments).validate
  end

  abstract def validate

end

