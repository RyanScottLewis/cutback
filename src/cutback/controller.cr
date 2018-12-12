abstract class Cutback::Controller

  extend Helpers::ClassTraversal

  include Helpers::Actionable
  include Helpers::CommandExecution
  include Helpers::GeneratorExecution
  include Helpers::MetadataCreation

  @logger      : Logger
  @app         : Definition::App
  @options     : Options
  @identifier  : Identifier
  @paths       : List::Path
  @tools       : List::Tool
  @controllers : List::Controller
  @router      : Router

  def initialize(@logger, @app, @options, @identifier, @paths, @tools, @controllers, @router)
  end

  delegate call, to: @router

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

end

