require_relative 'train'

class CargoTrain < Train

  def initialize(number)
    super
  end

  def type
    :cargo
  end
end
