class Generate::Formatter::Usage < Generate::Formatter

  @root : App::Root

  def initialize(@root)
  end

  def to_s(io)
    name = @root.for == :man ? @root.name.to_roff.bold : @root.name
    arguments = @root.arguments.map do |argument|
      if @root.for == :man
        argument.for(:usage_man).to_s
      else
        argument.for(:usage).to_s
      end
    end

    io << [name, arguments].flatten.join(" ")
  end

end

