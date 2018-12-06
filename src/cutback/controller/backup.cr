# TODO: Is a resource but with no metadata action, depends on metadata and config
class Cutback::Controller::Backup < Cutback::Controller

  actions create, read, update, destroy

  def create
    call("metadata", "create")
    call("config", "create")
  end

  def read
    data = String.build do |io| # TODO: A generator for this sort of jazz
      io << " Name     | Exists | Clean \n"
      io << "----------|--------|-------\n"

      names = %w[manifest records archive checksum metadata config]
      names.each do |name|
        controller = @controllers[name].as(Resource)
        name       = name.capitalize
        exists     = controller.resource_exists? ? "✓" : "✗"
        clean      = !controller.resource_stale? ? "✓" : "✗"

        io << " "
        io << [name.ljust(8), exists.ljust(6), clean].join(" | ")
        io << "\n"
      end
    end

    puts data
  end

  def update
    call("metadata", "update")
    call("config", "update")
  end

  def destroy
    call("manifest", "destroy")
    call("records", "destroy")
    call("archive", "destroy")
    call("checksum", "destroy")
    call("metadata", "destroy")
    call("config", "destroy")
  end

end

