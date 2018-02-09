require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :total_seats

  def initialize(args)
    @type = :passenger
    @total_seats = args
    super
  end

  def use_space(amount = 1)
    super
  end
end
