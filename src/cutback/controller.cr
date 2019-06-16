abstract class Cutback::Controller

  extend Helpers::ClassTraversal

  include Helpers::Actionable
  include Helpers::RouterDelegatable
  include Helpers::CommandExecution
  include Helpers::GeneratorExecution
  include Helpers::MetadataCreation

  @logger      : Logger
  @definition  : Definition::Application
  @options     : Options
  @identifier  : Identifier
  @paths       : List::Path
  @tools       : List::Tool
  @controllers : List::Controller
  @router      : Router

  def initialize(@logger, @definition, @options, @identifier, @paths, @tools, @controllers, @router)
  end

end

