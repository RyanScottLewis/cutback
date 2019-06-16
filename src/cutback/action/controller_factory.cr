class Cutback::Action::ControllerFactory < Cutback::Action

  delegate controllers, to: application

  def execute
    Controller.all.each do |controller_class|
      controllers[controller_class.name] = controller_class.new(application)
    end
  end

end

