require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :total_capacity

  def initialize(args)
    @type = :cargo
    @total_capacity = args
    super
  end
end
