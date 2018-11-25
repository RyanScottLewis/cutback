class Cutback::Router

  @arguments : Array(String)
  @routes    : RouteList
  @action    : String?
  @type      : String?

  def self.route(*arguments)
    new(*arguments).route
  end

  def initialize(@arguments, @routes)
  end

  def route
    get_action
    get_type
    perform_action
  end

  protected def get_action
    @action = @arguments[0]?
  end

  protected def get_type
    @type = @arguments[1]?
  end

  protected def perform_action
    case @action
    when nil        then perform_generate
    when "generate" then perform_generate
    when "inspect"  then perform_inspect
    end
  end

  protected def perform_generate
    @routes.generate(@type)
  end

  protected def perform_inspect
    if @type.nil? # TODO: A flag within the route or something
      @routes["metadata"].inspect
      @routes["checksum"].inspect
    else
      @routes.inspect(@type)
    end
  end

end

