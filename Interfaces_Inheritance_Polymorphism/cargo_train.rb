require_relative 'train'

class CargoTrain < Train

  attr_reader :TYPE

  def initialize(number)
    super
    @TYPE = :cargo
    @MAX_SPEED = 180
  end
end
