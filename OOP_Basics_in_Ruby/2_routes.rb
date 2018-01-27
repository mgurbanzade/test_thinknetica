class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_route(route_name)
    stations.insert(-2, route_name)
  end

  def remove_route(route_name)
    stations.delete(route_name)
  end

  def show
    stations.join(', ')
  end
end
