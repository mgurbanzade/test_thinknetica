require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'station'
require_relative 'routes'

class Main

  attr_accessor :user_stations, :user_trains, :user_routes

  def initialize
    @user_stations = []
    @user_trains = []
    @user_routes = []
  end

  def create_station
    puts "Придумайте название для станции:"
    u_station_name = gets.chomp

    user_stations << Station.new(u_station_name)

    puts "Создана станция #{u_station_name}"
  end

  def create_train
    puts "Грузовой или пассажирский?"
    user_train_type = gets.chomp

    if user_train_type.downcase != "грузовой" && user_train_type.downcase != "пассажирский"
      puts "Поездов такого типа не сущетсвует. Повторите попытку"
      return
    end

    puts "Номер поезда?"
    user_train_number = gets.chomp.to_i

    if user_trains.count >= 1
      user_trains.find do |train|
        if train.number == user_train_number
          puts "Поезд с номером #{user_train_number} уже существует. Введите другой номер"
          return
        end
      end
    end

    if user_train_type.downcase == 'пассажирский'
      user_trains << PassengerTrain.new(user_train_number)
      puts "Пассажирский поезд с номером #{user_train_number} был успешно создан."

    elsif user_train_type.downcase == 'грузовой'
      user_trains << CargoTrain.new(user_train_number)
      puts "Грузовой поезд с номером #{user_train_number} был успешно создан."
    end
  end

  def create_route
    puts "Список станций:"
    puts station_names_list
    puts "Введите название начальной станции:"
    user_first_station = gets.chomp
    puts "Введите название конечной станции:"
    user_last_station = gets.chomp

    user_stations.each do |station|
      if station.name == user_first_station
        user_first_station = station
      elsif station.name == user_last_station
        user_last_station = station
      end
    end

    user_routes << Route.new(user_first_station, user_last_station)
    puts "Маршрут #{user_first_station.name} - #{user_last_station.name} успешно создан."
  end

  def route_add_station
    puts "Список созданных маршрутов:"
    puts routes_list
    puts "Введите название маршрута:"
    user_route_name = gets.chomp

    user_routes.find do |route|
      if route.name == user_route_name
        puts "Список станций которых можно добавить в маршрут:"

        user_stations.find do |station|
          if !route.stations.include?(station)
            puts station.name
          end
        end

        puts "Введите название станции"
        user_add_station_route = gets.chomp

        user_stations.find do |station|
          if station.name == user_add_station_route
            route.add_station(station)
            puts "Станция #{station.name} добавлена в маршрут #{route.name}"
          end
        end
      end
    end
  end

  def route_remove_station
    puts "Список созданных маршрутов:"
    puts routes_list
    puts "Введите название маршрута:"
    user_route_name = gets.chomp

    user_routes.find do |route|
      if route.name == user_route_name
        puts "Список станций которых можно удалить из маршрута:"

        route.stations.find do |station|
          if station != route.stations.first && station != route.stations.last
            puts station.name
          end
        end

        puts "Введите название станции"
        user_add_station_route = gets.chomp

        user_stations.find do |station|
          if station.name == user_add_station_route
            puts "Станция #{station.name} удалена из маршрута #{route.name}"
            route.remove_station(station)
          end
        end
      end
    end
  end

  def train_set_route
    available_trains = []
    puts "Список созданных маршрутов:"
    puts routes_list
    puts "Введите название маршрута:"
    user_route_name = gets.chomp

    user_routes.find do |route|
      if route.name == user_route_name
        puts "Список поездов доступных поездов:"

        user_trains.each do |train|
          if train.route == nil
            available_trains << "Поезд номер #{train.number}"
          end
        end

        puts available_trains.join(', ')

        puts "Введите номер поезда"
        user_train_number = gets.chomp.to_i

        user_trains.find do |train|
          if train.number == user_train_number
            train.set_route(route)
            puts "Для поезда номер #{train.number} был назначен маршрут #{route.name}"
          end
        end
      end
    end
  end

  def train_attach_wagon
    puts "Список поездов:"
    puts trains_list
    puts "Введите номер поезда"
    user_train_number = gets.chomp.to_i

    user_trains.find do |train|
      if train.number == user_train_number
        if train.type == :passenger
          train.attach_wagon(PassengerWagon.new)
          puts "К поезду с номером #{train.number} был добавлен новый вагон. Теперь у поезда #{train.wagons.count} вагон(ов)"
        elsif train.type == :cargo
          train.attach_wagon(CargoWagon.new)
          puts "К поезду с номером #{train.number} был добавлен новый вагон. Теперь у поезда #{train.wagons.count} вагон(ов)"
        end
      end
    end
  end

  def train_detach_wagon
    puts "Список поездов:"
    puts trains_list
    puts "Введите номер поезда"
    user_train_number = gets.chomp.to_i

    user_trains.find do |train|
      if train.number == user_train_number
        train.detach_wagon
        puts "От поезда с номером #{train.number} был отцеплен один вагон. Теперь у поезда #{train.wagons.count} вагон(ов)"
      end
    end
  end

  def train_move_forward
    puts "Список поездов:"
    puts trains_list
    puts "Введите номер поезда"
    user_train_number = gets.chomp.to_i

    user_trains.find do |train|
      if train.number == user_train_number
        train.move_next_station
        puts "Поезд прибыл на станцию #{train.current_station.name}"
      end
    end
  end

  def train_move_backward
    puts "Список поездов:"
    puts trains_list
    puts "Введите номер поезда"
    user_train_number = gets.chomp.to_i

    user_trains.find do |train|
      if train.number == user_train_number
        train.move_previous_station
        puts "Поезд прибыл на станцию #{train.current_station.name}"
      end
    end
  end

  def show_stations
    puts station_names_list
  end

  def show_trains_on_station
    trains_on_station = []
    puts "Список станций:"
    puts station_names_list
    puts "Введите название станции"
    user_station_name = gets.chomp

    user_stations.each do |station|
      if station.name == user_station_name
        station.trains.each do |train|
          trains_on_station << "Поезд № #{train.number}"
        end
      end
    end

    puts trains_on_station.join(', ')
  end

  private

  def station_names_list
    st_list = []
    user_stations.each do |station|
      st_list << station.name
    end

    st_list.join(', ')
  end

  def routes_list
    rt_list = []
    user_routes.each do |route|
      rt_list << route.name
    end

    rt_list.join(', ')
  end

  def trains_list
    tr_list = []

    user_trains.each do |train|
      tr_list << "Поезд № #{train.number}"
    end

    tr_list.join(', ')
  end
end
