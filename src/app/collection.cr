class Generate::App::Collection(T) < Array(T)

  def for=(value)
    #each { |item| item.for = value }
    each(&.for=(value))
  end

  def to_s(io)
    io << map(&.to_s).join("\n")
  end

end

