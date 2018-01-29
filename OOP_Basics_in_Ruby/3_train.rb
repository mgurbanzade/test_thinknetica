class Train
  attr_reader :type, :number, :wagons, :speed, :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def accelerate(amount)
    amount > 0 ? self.speed += amount : false
  end

  def decelerate(amount)
    amount <= speed && amount > 0 ? self.speed -= amount : false
  end

  def attach_wagon
    self.speed == 0 ? self.wagons += 1 : false
  end

  def detach_wagon
    self.speed == 0 && self.wagons > 0 ? self.wagons -= 1 : false
  end

  def set_route(route)
    @route = route
    @station_index = 0
    route.stations[@station_index].train_arrival(self)
  end

  def current_station
    route.stations[@station_index]
  end

  def move_next_station
    return nil unless route
    if current_station != route.stations.last
      current_station.train_departure(self)
      @station_index += 1
      current_station.train_arrival(self)
    end
  end

  def move_previous_station
    return nil unless route
    if current_station != route.stations.first
      current_station.train_departure(self)
      @station_index -= 1
      current_station.train_arrival(self)
    end
  end

  def previous_station
    return nil unless route
    @station_index != 0 ? route.stations[@station_index - 1] : false
  end

  def next_station
    return nil unless route
    route.stations[@station_index + 1]
  end
end
