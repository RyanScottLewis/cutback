abstract class Cutback::Controller

  extend Helpers::ClassTraversal

  # TODO: Rename Helpers to Concerns and move to src/cutback/controllers/concerns/
  include Helpers::Actionable
  include Helpers::RouterDelegatable
  include Helpers::CommandExecution
  include Helpers::GeneratorExecution
  include Helpers::MetadataCreation

  @application : Cutback::Application

  def initialize(@application)
  end

  getter application

end

