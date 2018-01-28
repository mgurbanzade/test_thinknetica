class Train
  attr_reader :type, :number, :current_station
  attr_accessor :wagons, :speed, :route, :station_index

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
    route.stations[station_index].train_arrival(self)
  end

  def current_station
    route.stations[station_index]
  end

  def move_next_station
    return nil unless route
    if route.stations[station_index] != route.stations.last
      route.stations[station_index].train_departure(self)
      self.station_index += 1
      route.stations[station_index].train_arrival(self)
    end
  end

  def move_previous_station
    return nil unless route
    if route.stations[station_index] != route.stations.first
      route.stations[station_index].train_departure(self)
      station_index -= 1
      route.stations[station_index].train_arrival(self)
    end
  end

  def previous_station
    return nil unless route
    route.stations[station_index] != route.stations.first ? route.stations[station_index - 1] : nil
  end

  def next_station
    return nil unless route
    route.stations[station_index] != route.stations.last ? route.stations[station_index + 1] : nil
  end
end
