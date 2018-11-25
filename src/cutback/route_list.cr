class Cutback::RouteList

  @options : Options
  @paths   : PathList
  @tools   : ToolList
  @logger  : Logger
  @routes  = {} of String => Route::Base

  property logger

  macro add_route(name)
    @routes["{{name}}"] = Route::{{name.id.capitalize}}.new(@options, @paths, @tools, @logger)
  end

  def initialize(@options, @paths, @tools, @logger)
    add_route config
    add_route manifest
    add_route records
    add_route archive
    add_route checksum
    add_route metadata
  end

  delegate :[], to: @routes

  def valid?(name)
    @routes.has_key?(name)
  end

  def names
    @routes.keys
  end

  def all
    @routes.values
  end

  macro define_delegate(name)
    def {{name}}(type)
      if type.nil?
        @routes.values.each(&.{{name}})
      else
        @routes[type].{{name}}
      end
    end
  end

  define_delegate generate
  define_delegate inspect

end

