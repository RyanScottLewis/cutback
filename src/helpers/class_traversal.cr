module Cutback::Helpers::ClassTraversal

  def all
    {{ @type.all_subclasses.reject(&.abstract?) }}
  end

  def name
    {{ @type.id.split("::").last.underscore }}
  end

  def names
    all.map(&.name)
  end

  def []?(name)
    all.find { |subclass| subclass.name == name }
  end

  def valid?(name)
    names.includes?(name)
  end

end

