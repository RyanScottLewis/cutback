class Cutback::Processor::Controllers < Cutback::Processor

  @logger      : Cutback::Logger
  @app         : Definition::App
  @identifier  : Cutback::Identifier
  @paths       : List::Path
  @tools       : List::Tool
  @controllers : List::Controller
  @options     : Cutback::Options

  def self.execute!(*arguments)
    new(*arguments).execute!
  end

  def initialize(@logger, @app, @identifier, @paths, @tools, @controllers, @options)
  end

  def execute
    create_controllers
  end

  def execute! # TODO: Both Controllers and Logger processors have to do this
    super(@logger)
  end

  def create_controllers
    Cutback::Controller.all.each do |controller_class|
      @controllers[controller_class.name] = create(controller_class)
    end
  end

  protected def create(controller_class)
    controller_class.new(@app, @options, @paths, @tools, @identifier, @logger, @controllers)
  end

end

