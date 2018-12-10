class Cutback::Generator::BackupTable < Cutback::Generator

  @controllers : List::Controller

  def initialize(@controllers)
  end

  def generate
    String.build do |io|
      io << " Name     | Exists | Fresh \n"
      io << "----------|--------|-------\n"

      names = %w[manifest records archive checksum metadata config]
      names.each do |name|
        controller = @controllers[name].as(Controller::Resource)
        name       = name.capitalize
        exists     = controller.resource_exists? ? "✓" : "✗"
        clean      = !controller.resource_stale? ? "✓" : "✗"

        io << " "
        io << [name.ljust(8), exists.ljust(6), clean].join(" | ")
        io << "\n"
      end
    end
  end

end
