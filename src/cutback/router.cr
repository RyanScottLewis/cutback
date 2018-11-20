class Cutback::Router

  @arguments : Array(String)
  @routes    : Routes

  def initialize(@arguments, @routes)
  end

  def execute
    perform_action
  end

  protected def perform_action
    case @arguments[0]?
    when nil        then perform_generate
    when "generate" then perform_generate
    when "inspect"  then perform_inspect
    end
  end

  protected def perform_generate
    case @arguments[1]?
    when nil
      @routes.manifest.generate
      @routes.records.generate
      @routes.archive.generate
      @routes.metadata.generate
    when "manifest" then @routes.manifest.generate
    when "records"  then @routes.records.generate
    when "archive"  then @routes.archive.generate
    when "metadata" then @routes.metadata.generate
    end
  end

  protected def perform_inspect
    case @arguments[1]?
    when nil
      @routes.manifest.inspect
      @routes.records.inspect
      @routes.archive.inspect
      @routes.metadata.inspect
    when "manifest" then @routes.manifest.inspect
    when "records"  then @routes.records.inspect
    when "archive"  then @routes.archive.inspect
    when "metadata" then @routes.metadata.inspect
    end
  end

end
