abstract class Cutback::Controller

  @@actions = [] of Symbol

  def self.actions
    @@actions
  end

  @options : Options
  @paths   : PathList
  @tools   : ToolList
  @logger  : Logger

  def initialize(@options, @paths, @tools, @logger)
  end

  macro action(name)
    @@actions << {{name.id}}

    def {{name.id}}; end
  end

  action generate
  action inspect

end

