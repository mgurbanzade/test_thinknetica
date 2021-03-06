require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'outputs'
require_relative 'validation'
require_relative 'accessors'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  include Accessors

  TRAIN_NUMBER_FORMAT = /^[а-я0-9]{3}-?[а-я0-9]{2}$/i

  attr_reader :type, :number, :wagons, :speed, :route

  attr_accessor_with_history :train_length
  strong_attr_accessor :train_height, String

  validate :number, :type, String
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance
  end

  def accelerate(amount)
    self.speed += amount if amount > 0
  end

  def decelerate(amount)
    self.speed -= amount if amount <= speed && amount > 0
  end

  def attach_wagon(wagon)
    wagons << wagon if speed.zero? && wagon.type == type
  end

  def detach_wagon
    wagons.pop if speed.zero? && wagons.count > 0
  end

  def assign_route(route)
    @route = route
    @station_index = 0
    current_station.train_arrival(self)
  end

  def current_station
    route.stations[@station_index]
  end

  def move_next_station
    return unless route
    if current_station != route.stations.last
      current_station.train_departure(self)
      @station_index += 1
      current_station.train_arrival(self)
    end
  end

  def move_previous_station
    return unless route
    if current_station != route.stations.first
      current_station.train_departure(self)
      @station_index -= 1
      current_station.train_arrival(self)
    end
  end

  def previous_station
    return unless route
    @station_index != 0 ? route.stations[@station_index - 1] : false
  end

  def next_station
    return unless route
    route.stations[@station_index + 1]
  end

  def each_wagon(block)
    wagons.each { |wagon| block.call(wagon) }
  end
end
