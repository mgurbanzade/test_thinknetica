require_relative '3_train'

class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrival(number, type, wagon)
    trains << Train.new(number, type, wagon)
  end

  def train_departure(num)
    trains.delete_if {|obj| obj.number == num}
  end

  def train_types
    passenger = trains.select {|train| train.type == :passenger}
    cargo = trains.select {|train| train.type == :cargo}
    puts "Пассажирских: #{passenger.count}, грузовых: #{cargo.count}."
  end
end
