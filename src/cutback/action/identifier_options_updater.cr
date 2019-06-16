class Cutback::Action::IdentifierOptionsUpdater < Cutback::Action

  delegate identifier, options, to: application

  def execute
    identifier.date  = options.date
    identifier.index = options.index.not_nil! unless options.index.nil?
  end

end

