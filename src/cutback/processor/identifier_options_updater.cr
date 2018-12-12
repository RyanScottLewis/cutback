class Cutback::Processor::IdentifierOptionsUpdater < Cutback::Processor

  @identifier : Identifier
  @options    : Options

  def initialize(@identifier, @options)
  end

  def execute
    @identifier.date  = @options.date
    @identifier.index = @options.index.not_nil! unless @options.index.nil?
  end

end

