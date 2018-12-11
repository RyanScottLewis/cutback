abstract class Cutback::Controller

  @@actions = [] of String

  def self.action?(name)
    @@actions.includes?(name)
  end

  def self.actions
    @@actions
  end

  macro actions(*names)
    @@actions = [{{*names.map(&.id.stringify)}}]

    def execute(action)
      {% begin %}
        case action.strip.downcase
        {% for name, index in names %}
          when {{name.id.stringify}} then {{name.id}}
        {% end %}
        end
      {% end %}
    end
  end

  macro delegate_actions(*names, to controller)
    {% for name, index in names %}
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

  extend Helpers::ClassTraversal

  include Helpers::CommandExecution
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

  def call(controller, action)
    @logger.debug("Controller: Calling #{controller}##{action}")
    @controllers[controller].execute(action)
  end

end

