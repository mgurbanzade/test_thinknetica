require_relative 'main'
require_relative 'outputs'

class Interface

  def initialize
    @main = Main.new
    run_interface
  end

  def run_interface
    loop do
      puts "-----------------------"
      puts MENU[:type_action_name]
      show_methods
      user_action = gets.chomp

      system('clear')

      case user_action
      when MENU[:create_station]
        @main.create_station
      when MENU[:create_train]
        @main.create_train
      when MENU[:create_route]
        @main.create_route
      when MENU[:add_station]
        @main.route_add_station
      when MENU[:remove_station]
        @main.route_remove_station
      when MENU[:set_route]
        @main.train_set_route
      when MENU[:attach_wagon]
        @main.train_attach_wagon
      when MENU[:detach_wagon]
        @main.train_detach_wagon
      when MENU[:move_forward]
        @main.train_move_forward
      when MENU[:move_backward]
        @main.train_move_backward
      when MENU[:show_stations_list]
        @main.show_stations
      when MENU[:show_trains_on_station]
        @main.show_trains_on_station
      when MENU[:show_wagons_list]
        @main.train_wagons_list
      when MENU[:use_wagon_space]
        @main.train_use_wagon_space
      when MENU[:exit]
        break
      end
    end
  end

  private

  def train_move
    forward_status = false
    backward_status = false

    @main.user_trains.find do |train|
      if train.route != nil
        forward_status = true if train.current_station != train.route.stations.last
        backward_status = true if train.current_station != train.route.stations.first
      end
    end

    puts "-- #{MENU[:move_forward]}" if forward_status
    puts "-- #{MENU[:move_backward]}" if backward_status
  end

  def station_trains
    stations_status = false

    @main.user_stations.find do |station|
      stations_status = true if station.trains.size >= 1
    end

    puts "-- #{MENU[:show_trains_on_station]}" if stations_status
  end

  def route_remove_station
    @main.user_routes.find do |route|
      puts "-- #{MENU[:remove_station]}" if route.stations.size > 2
    end
  end

  def detach_wagon
    wagon_status = false

    @main.user_trains.find do |train|
      wagon_status = true if train.wagons.size > 0 && @main.user_trains.size >= 1
    end

    puts "-- #{MENU[:detach_wagon]}" if wagon_status
  end

  def wagons_manipulation(output)
    train_wagons = @main.user_trains.find { |train| !train.wagons.empty? }
    puts "-- #{MENU[output]}" unless train_wagons.nil?
  end

  def show_methods
    puts "-- #{MENU[:create_station]}"
    puts "-- #{MENU[:create_train]}"
    puts "-- #{MENU[:create_route]}" if @main.user_stations.size >= 2
    puts "-- #{MENU[:add_station]}" if @main.user_routes.size >= 1 && @main.user_stations.size > 2
    route_remove_station
    puts "-- #{MENU[:set_route]}" if @main.user_trains.size >= 1 && @main.user_routes.size >= 1
    puts "-- #{MENU[:attach_wagon]}" if @main.user_trains.size >= 1
    detach_wagon
    wagons_manipulation(:show_wagons_list)
    wagons_manipulation(:use_wagon_space)
    train_move
    puts "-- #{MENU[:show_stations_list]}" if @main.user_stations.size >= 1
    station_trains
    puts "-- #{MENU[:exit]}"
  end
end

interface = Interface.new


