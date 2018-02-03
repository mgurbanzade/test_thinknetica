class Station
  attr_reader :trains, :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @@stations << self
    @name = name
    @trains = []
  end

  def train_arrival(train)
    trains << train
  end

  def train_departure(train)
    trains.delete(train)
  end

  def train_types(type)
    trains.count { |train| train.type == type }
  end
end
