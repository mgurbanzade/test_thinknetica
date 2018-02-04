require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super
  end

  def type
    :passenger
  end
end
