require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(args)
    @type = :cargo
    super
  end
end
