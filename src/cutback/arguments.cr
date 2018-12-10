class Cutback::Arguments < Array(String)

  def initialize(arguments)
    @size     = 0
    @capacity = 0
    @buffer   = Pointer(T).null

    concat(arguments)
  end

  def process
    Processor::Arguments.process(self)
  end

  def validate
    Validator::Arguments.validate(self)
  end

end

