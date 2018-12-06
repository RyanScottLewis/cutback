class Cutback::Controller::Backup < Cutback::Controller

  actions create, read, update, destroy

  def create
    call(%w[metadata config], "create")
  end

  def read
    data = String.build do |io| # TODO: A generator for this sort of jazz
      io << " Name     | Exists | Fresh \n"
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
    call(%w[metadata config], "update")
  end

  def destroy
    call(%w[manifest records archive checksum metadata config], "destroy")
  end

  protected def call(controllers : Array(String), action)
    controllers.each { |controller| call(controller, action) }
  end

end

