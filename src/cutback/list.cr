abstract class Cutback::List(T) # TODO: Rename to Hash or... Dictionary?

  @all = {} of String => T

  getter all

  delegate :[], :[]=, has_key?, to: @all

  macro key_delegate(name) # TODO: Rename to hash_getter
    def {{name.id}}
      @all[{{name.id.stringify}}]
    end
  end

end

