class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def build_station(station_name)
    @stations.insert(-2, station_name)
  end

  def demolish_station(station_name)
    @stations.delete(station_name)
  end

  def show
    @stations.join(', ')
  end
end
