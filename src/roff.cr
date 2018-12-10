module Roff

  def self.escape(value)
    value.gsub(/-/, "\\-")
  end

  class String

    @value : ::String

    forward_missing_to @value

    def initialize(@value)
    end

    def bold
      "\\fB#{@value}\\fR"
    end

    def italic
      "\\fI#{@value}\\fR"
    end

    def to_s(io)
      io << Roff.escape(@value)
    end

  end

end


class String
  def to_roff
    Roff::String.new(self)
  end
end
