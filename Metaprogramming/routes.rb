require_relative 'instance_counter'
require_relative 'outputs'
require_relative 'validation'
require_relative 'accessors'

class Route
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :stations, :name

  attr_accessor_with_history :route_length
  strong_attr_accessor :route_station, String

  validate :name, :type, String

  def initialize(first, last)
    @stations = [first, last]
    validate!
    @name = "#{first.name} - #{last.name}"
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end
end
