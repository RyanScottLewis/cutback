# TODO: Unneeded
class Cutback::Arguments < Array(String)

  def initialize(arguments)
    @size     = 0
    @capacity = 0
    @buffer   = Pointer(T).null

    concat(arguments)
  end

end

