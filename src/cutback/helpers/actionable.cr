module Cutback::Helpers::Actionable

  @@actions = [] of String

  module ClassMethods

    def action?(name)
      @@actions.includes?(name)
    end

    def actions
      @@actions
    end

  end

  macro included
    extend ClassMethods
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

end

