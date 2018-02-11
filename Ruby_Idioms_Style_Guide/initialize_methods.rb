module InitializeMethods
  def create_station
    puts OUTPUTS[:station_name]
    u_station_name = gets.chomp
    user_stations << Station.new(u_station_name)
    puts OUTPUTS[:station_created] + u_station_name
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_train
    puts OUTPUTS[:train_type]
    user_train_type = gets.chomp.downcase

    return puts OUTPUTS[:no_type] unless TYPES.include?(user_train_type)

    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp

    if user_train_type == TYPES[1]
      user_trains << PassengerTrain.new(user_train_number)
      puts OUTPUTS[:pass_train_created]

    elsif user_train_type == TYPES[0]
      user_trains << CargoTrain.new(user_train_number)
      puts OUTPUTS[:cargo_train_created]
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_route
    puts OUTPUTS[:stations_list]
    puts list_names(user_stations)
    puts OUTPUTS[:first_station_name]
    user_first_station = gets.chomp
    puts OUTPUTS[:last_station_name]
    user_last_station = gets.chomp

    user_stations.each do |station|
      if station.name == user_first_station
        user_first_station = station
      elsif station.name == user_last_station
        user_last_station = station
      end
    end

    user_routes << Route.new(user_first_station, user_last_station)
    puts OUTPUTS[:route_created]
  rescue RuntimeError => e
    puts e.message
    retry
  end
end
