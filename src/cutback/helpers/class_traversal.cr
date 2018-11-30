module Cutback::Helpers::ClassTraversal

  def all
    {{ @type.all_subclasses }}
  end

  def name
    {{ @type.id.stringify }}.split("::").last.underscore
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

