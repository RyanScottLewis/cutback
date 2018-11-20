abstract class Cutback::Command::Generate < Cutback::Command

  @paths : Paths

  def initialize(@options, @paths)
  end

  protected def progress
    name = self.class.name.split("::").last

    progress("Generating #{name}")
  end

end

