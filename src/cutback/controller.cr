abstract class Cutback::Controller

  @@actions = [] of String

  def self.all
    {{ @type.all_subclasses }}
  end

  def self.name
    {{ @type.id.stringify }}.split("::").last.underscore
  end

  def self.names
    all.map(&.name)
  end

  def self.[]?(name)
    all.find { |subclass| subclass.name == name }
  end

  def self.valid?(name)
    names.includes?(name)
  end

  def self.action?(name)
    @@actions.includes?(name)
  end

  @options : Options
  @paths   : PathList
  @tools   : ToolList
  @logger  : Logger

  def initialize(@options, @paths, @tools, @logger)
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

