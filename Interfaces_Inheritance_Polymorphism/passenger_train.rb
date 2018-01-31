require_relative 'train'

class PassengerTrain < Train

  attr_reader :TYPE

  def initialize(number)
    super
    @TYPE = :passenger
    @MAX_SPEED = 300
  end
end
