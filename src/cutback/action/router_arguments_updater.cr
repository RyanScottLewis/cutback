class Cutback::Action::RouterArgumentsUpdater < Cutback::Action

  delegate arguments, router, to: application

  def execute
    if arguments.size == 2
      router.controller = arguments[0]
      router.action     = arguments[1]
    elsif arguments.size == 1
      router.action     = arguments[0]
    end
  end

end

