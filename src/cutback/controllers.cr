class Cutback::Controllers < Cutback::List(Cutback::Controller)

  @options    : Options
  @paths      : Paths
  @tools      : Tools
  @identifier : Identifier
  @logger     : Logger

  def initialize(@options, @paths, @tools, @identifier, @logger)
    update
  end

  def update
    Controller.all.each { |controller| update(controller) }
  end

  protected def update(controller)
    @all[controller.name] = create(controller)
  end

  protected def create(controller)
    controller.new(@options, @paths, @tools, @identifier, @logger, self)
  end

end

