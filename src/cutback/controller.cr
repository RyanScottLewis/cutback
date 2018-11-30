abstract class Cutback::Controller

  def self.subclasses
    {{ @type.subclasses }}
  end

  def self.name
    {{ @type.id.stringify }}.split("::").last.underscore
  end

  def self.[](name)
    subclasses.find { |subclass| subclass.name == name }
  end

  @options : Options
  @paths   : PathList
  @tools   : ToolList
  @logger  : Logger

  def initialize(@options, @paths, @tools, @logger)
  end

  def generate; end
  def inspect; end

  def execute(name)
    case name.strip.downcase
    when "generate" then generate
    when "inspect"  then inspect
    end
  end

end

