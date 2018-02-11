require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'station'
require_relative 'routes'
require_relative 'outputs'
require_relative 'initialize_methods'
require_relative 'station_methods'
require_relative 'route_methods'
require_relative 'train_methods'

class Main
  include InitializeMethods
  include StationMethods
  include RouteMethods
  include TrainMethods

  attr_accessor :user_stations, :user_trains, :user_routes

  def initialize
    @user_stations = []
    @user_trains = []
    @user_routes = []
  end

  private

  def show_train_info(x)
    puts "Поезд № #{x.number}, Тип: #{x.type}, Вагоны: #{x.wagons.size}"
  end

  def show_wagon_info(x)
    puts "Вагон номер: #{x.number},
          тип: #{x.type},
          свободные места: #{x.available_space},
          занятые места: #{x.used_space}"
  end

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
