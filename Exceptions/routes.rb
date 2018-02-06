require_relative 'instance_counter'

class Route
  attr_reader :stations, :name

  include InstanceCounter

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

  private

  def validate!
    raise RuntimeError unless stations != nil
    true
  end
end
