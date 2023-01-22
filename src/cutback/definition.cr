abstract class Cutback::Definition

  include Helpers::Mappable

  @[YAML::Field(ignore: true)]
  @[JSON::Field(ignore: true)]
  property for : Symbol?

  def for(value)
    dup.tap(&.for=(value))
  end

  macro formatters(*names, default=@name)

    def to_s(io)
      {% begin %}
        io << case @for
        {% for name, index in names %}
          when {{name.id.symbolize}} then Formatter::{{name.id.capitalize}}::{{@type.name.split("::").last.id}}.format(self)
        {% end %}
        else
          {{default}}
        end
      {% end %}
    end

  end

end

