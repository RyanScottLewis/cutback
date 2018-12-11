class Cutback::List::Controller < Cutback::List(Cutback::Controller)

  @app        : Definition::App
  @options    : Options
  @paths      : List::Path
  @tools      : List::Tool
  @identifier : Identifier
  @logger     : Logger

  def initialize(@app, @options, @paths, @tools, @identifier, @logger)
    update
  end

  def update
    Cutback::Controller.all.each { |controller| update(controller) }
  end

  protected def update(controller)
    @all[controller.name] = create(controller)
  end

  protected def create(controller)
    controller.new(@app, @options, @paths, @tools, @identifier, @logger, self)
  end

end

