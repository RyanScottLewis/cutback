class Cutback::Processor::Identifier < Cutback::Processor

  @identifier : Cutback::Identifier
  @options    : Cutback::Options

  def initialize(@identifier, @options)
  end

  def execute
    @identifier.date  = @options.date
    @identifier.index = @options.index.not_nil! unless @options.index.nil?
  end

end

