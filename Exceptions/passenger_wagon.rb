require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize
    @type = :passenger
    @seats = 50
    super
  end
end
