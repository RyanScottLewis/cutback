abstract class Cutback::Validator::Base

  def self.validate(*arguments)
    new(*arguments).validate
  end

  abstract def validate

end

