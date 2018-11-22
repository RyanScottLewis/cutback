class Cutback::RouteList

  @options : Options
  @paths   : PathList
  @routes  = {} of String => Route::Base

  macro add_route(name)
    @routes["{{name}}"] = Route::{{name.id.capitalize}}.new(@options, @paths)
  end

  def initialize(@options, @paths)
    add_route manifest
    add_route records
    add_route archive
    add_route checksum
    add_route metadata
  end

  def valid?(name)
    @routes.key?(name)
  end

  def all
    @routes.values
  end

  macro define_delegate(name)
    def {{name}}(type)
      if type.nil?
        @routes.values.each(&.{{name}})
      else
        @routes[type].inspect
      end
    end
  end

  define_delegate generate
  define_delegate inspect

end

