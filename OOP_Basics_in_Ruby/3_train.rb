class Train
  attr_reader :type
  attr_accessor :wagons, :speed, :current_station, :number

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
    self.speed == 0 ? self.wagons -= 1 : false
  end

  def get_route(route)
    self.current_station = route.stations[0]
    self.current_station.train_arrival(self)
  end

  def get_index(route)
    route.stations.index(self.current_station)
  end

  def move_forward(route)
    if self.current_station != route.stations.last
      self.current_station.train_departure(self)
      self.current_station = route.stations[get_index(route) + 1]
      self.current_station.train_arrival(self)
    end
  end

  def move_backward(route)
    if self.current_station != route.stations.first
      self.current_station.train_departure(self)
      self.current_station = route.stations[get_index(route) - 1]
      self.current_station.train_arrival(self)
    end
  end

  def prev_station(route)
    self.current_station != route.stations.first ? prev_station = route.stations[get_index(route) - 1] : nil
  end

  def next_station(route)
    self.current_station != route.stations.last ? next_station = route.stations[get_index(route) + 1] : nil
  end
end
