abstract class Cutback::Command::Inspect < Cutback::Command::Base

  @paths : Paths

  def initialize(@options, @paths)
  end

  protected def progress(*arguments)
    name = self.class.name.split("::").last

    super(*arguments).with_name("Inspecting #{name}")
  end

end

