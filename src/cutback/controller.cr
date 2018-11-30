abstract class Cutback::Controller

  @@actions = [] of String

  def self.action?(name)
    @@actions.includes?(name)
  end

  def self.actions
    @@actions
  end

  extend Helpers::ClassTraversal

  include Helpers::CommandExecution

  @options     : Options
  @paths       : PathList
  @tools       : ToolList
  @identifier  : Identifier
  @logger      : Logger
  @controllers : ControllerList

  def initialize(@options, @paths, @tools, @identifier, @logger, @controllers)
  end

  macro actions(*names)
    @@actions = [{{*names.map(&.id.stringify)}}]

    {% for name, index in names %}
      def {{name.id}}; end
    {% end %}

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

end

