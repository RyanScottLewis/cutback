module Cutback::Helpers::RouterDelegatable

  delegate call, to: @router

  macro delegate_action(name, to controller, action action_name)
    def {{name.id}}
      call({{controller.id.stringify}}, {{action_name.id.stringify}})
    end
  end

  macro delegate_actions(*names, to controller)
    {% for name, index in names %} # TODO: Use delegate_action
      delegate_action({{name.id}}, to: {{controller.id}}, action: {{name.id}})
    {% end %}
  end

end

