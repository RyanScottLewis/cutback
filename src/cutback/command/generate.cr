abstract class Cutback::Command::Generate < Cutback::Command::Base

  protected def progress(*arguments)
    name = self.class.name.split("::").last

    super(*arguments).with_name("Generating #{name}")
  end

end

