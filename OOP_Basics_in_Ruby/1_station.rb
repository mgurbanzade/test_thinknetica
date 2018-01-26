class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = {}
  end

  def train_arrival(name, type)
    @trains[name] = type
  end

  def train_departure(name)
    @trains.delete(name)
  end

  def names_list
    names = []

    @trains.each do |name, type|
      names << name
    end
  end

  def types_list
    passenger = []
    cargo = []

    @trains.each do |name, type|
      passenger << type if type == :passenger
      cargo << type if type == :cargo
    end
  end
end
