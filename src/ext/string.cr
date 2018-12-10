class String

  def indent(level=2)
    lines.map { |line| "#{" " * level}#{line}" }.join("\n")
  end

end

