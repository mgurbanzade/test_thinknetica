module RouteMethods
  def route_add_station
    puts OUTPUTS[:created_routes]
    puts list_names(user_routes)
    puts OUTPUTS[:type_route_name]
    user_route_name = gets.chomp

    user_routes.find do |route|
      next unless route.name == user_route_name
      puts OUTPUTS[:available_stations]

      user_stations.find do |station|
        puts station.name unless route.stations.include?(station)
      end

      puts OUTPUTS[:type_station_name]
      user_add_route = gets.chomp

      available_station = choose_station(user_stations, user_add_route)
      route.add_station(available_station) unless available_station.nil?
      puts OUTPUTS[:station_added]
    end
  end

  def route_remove_station
    puts OUTPUTS[:created_routes]
    puts list_names(user_routes)
    puts OUTPUTS[:type_route_name]
    user_route_name = gets.chomp

    user_routes.find do |route|
      next unless route.name == user_route_name
      puts OUTPUTS[:removable_stations]

      route.stations.find do |station|
        puts station.name if proper_position
      end

      puts OUTPUTS[:type_station_name]
      user_remove_route = gets.chomp

      removable_station = choose_station(user_stations, user_remove_route)
      puts OUTPUTS[:station_deleted]
      route.remove_station(removable_station)
    end
  end

  def proper_position
    station != route.stations.first && station != route.stations.last
  end
end
