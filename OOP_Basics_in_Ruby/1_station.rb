class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrival(train)
    trains << train
  end

  def train_departure(train)
    trains.delete(train)
  end

  def train_types
    passenger = trains.select {|train| train.type == "пассажирский"}
    cargo = trains.select {|train| train.type == "грузовой"}
    return "#{passenger.count} пассажирских, и #{cargo.count} грузовых"
  end
end
