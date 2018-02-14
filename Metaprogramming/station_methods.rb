module StationMethods
  def show_stations
    puts list_names(user_stations)
  end

  def show_trains_on_station
    puts OUTPUTS[:stations_list]
    puts list_names(user_stations)
    puts OUTPUTS[:type_station_name]
    user_station_name = gets.chomp

    choosed_station = choose_station(user_stations, user_station_name)
    train_info = ->(train) { show_train_info(train) }
    choosed_station.each_train(train_info) unless choosed_station.nil?
  end
end
