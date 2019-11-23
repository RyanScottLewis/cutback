# TODO:
# * RENAME.. no traversal is occuring here. ClassCollection?
# * Split out .name, .names, etc which depend on instance's #name into another concern
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

