abstract class Cutback::Definition

  property for : Symbol?

  def self.load(path)
    from_yaml(File.read(path))
  end

  def for(value)
    instance = dup
    instance.for = value

    instance
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

  macro mapping(**properties)
    YAML.mapping({{properties}})
  end

end

