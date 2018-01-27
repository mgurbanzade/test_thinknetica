require_relative '2_routes'

class Train
  attr_accessor :wagons, :speed, :route, :current_station, :number, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def accelerate(speed)
    speed > 0 ? self.speed += speed : false
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

  def get_route
    @route = Route.new('Баку', 'Москва')
    route.add_route('Ростов-на-Дону')
    self.current_station = route.stations[0]
  end

  def get_index
    route.stations.index(self.current_station)
  end

  def move_forward
    self.current_station != route.stations.last ? self.current_station = route.stations[get_index + 1] : false
  end

  def move_backward
    self.current_station != route.stations.first ? self.current_station = route.stations[get_index - 1] : false
  end

  def prev_station
    prev_station = route.stations[get_index - 1]
  end

  def next_station
    next_station = route.stations[get_index + 1]
  end
end
