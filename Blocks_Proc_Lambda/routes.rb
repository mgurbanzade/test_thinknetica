require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :name

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
    raise EX_MESSAGES[:route_stations] if stations == ['',''] || stations == ['/[а-яА-Я]/', ''] || stations == ['','/[а-яА-Я]/']
    true
  end
end
