class Train
  attr_reader :type, :number
  attr_accessor :wagons, :speed, :current_station, :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def accelerate(amount)
    amount > 0 ? self.speed += amount : false
  end

  def stop
    self.speed = 0
  end

  def attach_wagon
    self.speed == 0 ? self.wagons += 1 : false
  end

  def detach_wagon
    self.speed == 0 && self.wagons > 0 ? self.wagons -= 1 : false
  end

  def set_route(route)
    self.route = route
    self.current_station = route.stations[0]
    self.current_station.train_arrival(self)
  end

  def station_index
    route.stations.index(self.current_station)
  end

  def move_next_station
    return nil unless route
    if self.current_station != route.stations.last
      self.current_station.train_departure(self)
      self.current_station = route.stations[station_index + 1]
      self.current_station.train_arrival(self)
    end
  end

  def move_previous_station
    return nil unless route
    if self.current_station != route.stations.first
      self.current_station.train_departure(self)
      self.current_station = route.stations[station_index - 1]
      self.current_station.train_arrival(self)
    end
  end

  def previous_station
    return nil unless route
    self.current_station != route.stations.first ? route.stations[station_index - 1] : nil
  end

  def next_station
    return nil unless route
    self.current_station != route.stations.last ? route.stations[station_index + 1] : nil
  end
end
