require_relative '1_routes.rb'

class Train
  attr_accessor :wagons, :speed, :route, :current_st, :prev_station, :next_station, :get_index

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def accelerate(speed)
    self.speed = speed
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
    @route.build_station('Ростов-на-Дону')
    self.current_st = @route.stations[0]
  end

  def move_forward
    get_index = @route.stations.index(self.current_st)
    self.current_st = @route.stations[get_index + 1]
  end

  def move_backward
    get_index = @route.stations.index(self.current_st)
    self.current_st = @route.stations[get_index - 1]
  end

  def prev_station
    get_index = @route.stations.index(self.current_st)
    prev_station = @route.stations[get_index - 1]
  end

  def next_station
    get_index = @route.stations.index(self.current_st)
    next_station = @route.stations[get_index + 1]
  end
end
