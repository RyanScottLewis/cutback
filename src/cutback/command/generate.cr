abstract class Cutback::Command::Generate < Cutback::Command

  @paths : Paths

  def initialize(@options, @paths)
  end

  protected def progress(*arguments)
    name = self.class.name.split("::").last

    super(*arguments).with_name("Generating #{name}")
  end

end

