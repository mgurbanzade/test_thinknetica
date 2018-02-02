require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'station'
require_relative 'routes'
require_relative 'outputs'

class Main

  attr_accessor :user_stations, :user_trains, :user_routes

  def initialize
    @user_stations = []
    @user_trains = []
    @user_routes = []
  end

  def create_station
    puts OUTPUTS[:station_name]
    u_station_name = gets.chomp
    user_stations << Station.new(u_station_name)
    puts OUTPUTS[:station_created] + u_station_name
  end

  def create_train
    puts OUTPUTS[:train_type]
    user_train_type = gets.chomp.downcase

    return puts OUTPUTS[:no_type] unless PERMITTED_TYPES.include?(user_train_type)

    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp.to_i

    if user_trains.size >= 1
      choosed_train = choose_train(user_trains, user_train_number)
      return puts OUTPUTS[:train_exists] unless choosed_train.nil?
    end

    if user_train_type == PERMITTED_TYPES[1]
      user_trains << PassengerTrain.new(user_train_number)
      puts OUTPUTS[:pass_train_created]

    elsif user_train_type == PERMITTED_TYPES[0]
      user_trains << CargoTrain.new(user_train_number)
      puts OUTPUTS[:cargo_train_created]
    end
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
  end

  def route_add_station
    puts OUTPUTS[:created_routes]
    puts list_names(user_routes)
    puts OUTPUTS[:type_route_name]
    user_route_name = gets.chomp

    user_routes.find do |route|
      if route.name == user_route_name
        puts OUTPUTS[:available_stations]

        user_stations.find do |station|
          puts station.name if !route.stations.include?(station)
        end

        puts OUTPUTS[:type_station_name]
        user_add_station_route = gets.chomp

        available_station = choose_station(user_stations, user_add_station_route)
        route.add_station(available_station) unless available_station.nil?
        puts OUTPUTS[:station_added]
      end
    end
  end

  def route_remove_station
    puts OUTPUTS[:created_routes]
    puts list_names(user_routes)
    puts OUTPUTS[:type_route_name]
    user_route_name = gets.chomp

    user_routes.find do |route|
      if route.name == user_route_name
        puts OUTPUTS[:removable_stations]

        route.stations.find do |station|
          puts station.name if station != route.stations.first && station != route.stations.last
        end

        puts OUTPUTS[:type_station_name]
        user_remove_station_route = gets.chomp

        removable_station = choose_station(user_stations, user_remove_station_route)
        puts OUTPUTS[:station_deleted]
        route.remove_station(removable_station)
      end
    end
  end

  def train_set_route
    available_trains = []
    puts OUTPUTS[:created_routes]
    puts list_names(user_routes)
    puts OUTPUTS[:type_route_name]
    user_route_name = gets.chomp

    user_routes.find do |route|
      if route.name == user_route_name
        puts OUTPUTS[:available_trains]

        user_trains.each do |train|
          available_trains << "Поезд № #{train.number}" if train.route.nil?
        end

        puts available_trains.join(', ')

        puts OUTPUTS[:train_number]
        user_train_number = gets.chomp.to_i

        choosed_train = choose_train(user_trains, user_train_number)
        choosed_train.set_route(route)
        puts OUTPUTS[:route_assigned]
      end
    end
  end

  def train_attach_wagon
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp.to_i

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.attach_wagon(PassengerWagon.new) if choosed_train.type == :passenger
    choosed_train.attach_wagon(CargoWagon.new) if choosed_train.type == :cargo
    puts OUTPUTS[:wagon_added] unless choosed_train.nil?
  end

  def train_detach_wagon
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp.to_i

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.detach_wagon
    puts OUTPUTS[:wagon_detached] unless choosed_train.nil?
  end

  def train_move_forward
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp.to_i

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.move_next_station
    puts OUTPUTS[:train_has_arrived] + choosed_train.current_station.name unless choosed_train.nil?
  end

  def train_move_backward
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp.to_i

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.move_previous_station
    puts OUTPUTS[:train_has_arrived] + choosed_train.current_station.name unless choosed_train.nil?
  end

  def show_stations
    puts list_names(user_stations)
  end

  def show_trains_on_station
    trains_on_station = []
    puts OUTPUTS[:stations_list]
    puts list_names(user_stations)
    puts OUTPUTS[:type_station_name]
    user_station_name = gets.chomp

    choosed_station = choose_station(user_stations, user_station_name)

    unless choosed_station.nil?
      choosed_station.trains.each do |train|
        trains_on_station << "Поезд № #{train.number}"
      end
      puts trains_on_station.join(', ')
    end
  end

  private

  def choose_station(arr, compared_to)
    arr.find { |station| station.name == compared_to }
  end

  def choose_train(arr, compared_to)
    arr.find { |train| train.number == compared_to }
  end

  def list_names(arr)
    list = []

    arr.each do |elem|
      list << elem.name
    end

    list.join(', ')
  end

  def trains_list
    list = []

    user_trains.each do |train|
      list << "Поезд № #{train.number}"
    end

    list.join(', ')
  end
end
