class Cutback::Action::ControllerFactory < Cutback::Action

  @logger      : Cutback::Logger
  @definition  : Definition::Application
  @identifier  : Identifier
  @paths       : List::Path
  @tools       : List::Tool
  @controllers : List::Controller
  @router      : Router
  @options     : Options

  def self.execute!(*arguments)
    new(*arguments).execute!
  end

  def initialize(@logger, @definition, @options, @identifier, @paths, @tools, @controllers, @router)
  end

  def execute
    create_controllers
  end

  def execute! # TODO: Both Controllers and Logger processors have to do this
    super(@logger)
  end

  def create_controllers
    Controller.all.each do |controller_class|
      @controllers[controller_class.name] = create(controller_class)
    end
  end

  protected def create(controller_class)
    controller_class.new(@logger, @definition, @options, @identifier, @paths, @tools, @controllers, @router)
  end

end

