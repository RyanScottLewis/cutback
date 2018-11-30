class Cutback::ControllerList

  @options    : Options
  @paths      : PathList
  @tools      : ToolList
  @identifier : Identifier
  @logger     : Logger

  @all = {} of String => Controller

  def initialize(@options, @paths, @tools, @identifier, @logger)
    Controller.all.each do |controller|
      @all[controller.name] = controller.new(@options, @paths, @tools, @identifier, @logger, self)
    end
  end

  delegate :[], to: @all

  getter all

  def valid?(name)
    @all.has_key?(name)
  end

end

