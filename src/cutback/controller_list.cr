class Cutback::ControllerList

  @options : Options
  @paths   : PathList
  @tools   : ToolList
  @logger  : Logger

  @all = {} of String => Controller

  def initialize(@options, @paths, @tools, @logger)
    Controller.subclasses.each do |controller|
      @all[controller.name] = controller.new(@options, @paths, @tools, @logger)
    end
  end

  delegate :[], to: @all

  getter all

  def valid?(name)
    @all.has_key?(name)
  end

  def names
    @all.keys
  end

end

