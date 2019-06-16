class Cutback::Action::ToolsOptionsUpdater < Cutback::Action

  delegate tools, options, to: application

  macro update_tool(name)
    tools[{{name.id.stringify}}] = options.{{name}}.not_nil! unless options.{{name}}.nil?
  end

  def execute
    update_tool(archiver)
    update_tool(checker)
    update_tool(compressor)
    update_tool(finder)
    update_tool(reader)
    update_tool(viewer)
  end

end

