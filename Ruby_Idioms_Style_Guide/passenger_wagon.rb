require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(args)
    @type = :passenger
    super
  end

  def use_space(amount = 1)
    super
  end
end
