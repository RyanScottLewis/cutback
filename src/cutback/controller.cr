abstract class Cutback::Controller

  extend Helpers::ClassTraversal

  include Helpers::Actionable
  include Helpers::CommandExecution
  include Helpers::GeneratorExecution
  include Helpers::MetadataCreation

  @app         : Definition::App
  @options     : Options
  @paths       : List::Path
  @tools       : List::Tool
  @identifier  : Identifier
  @logger      : Logger
  @controllers : List::Controller

  def initialize(@app, @options, @paths, @tools, @identifier, @logger, @controllers)
  end

  macro delegate_actions(*names, to controller)
    {% for name, index in names %} # TODO: Use delegate_action
      def {{name.id}}
        call({{controller.id.stringify}}, {{name.id.stringify}})
      end
    {% end %}
  end

  macro delegate_action(name, to controller, action action_name)
    def {{name.id}}
      call({{controller.id.stringify}}, {{action_name.id.stringify}})
    end
  end

  # TODO: Move to router? Makes sense right?
  def call(controller, action)
    @logger.debug("Controller: Calling #{controller}##{action}")
    @controllers[controller].execute(action)
  end

end

