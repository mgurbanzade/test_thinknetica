require_relative 'main'

@main = Main.new

@create_station = "создать станцию"
@create_train = "создать поезд"
@create_route = "создать маршрут"
@add_station = "добавить станцию в маршрут"
@remove_station = "удалить станцию из маршрута"
@set_route = "назначить маршрут поезду"
@attach_wagon = "добавить вагон"
@detach_wagon = "отцепить вагон"
@move_forward = "двигаться вперед по маршруту"
@move_backward = "двигаться назад по маршруту"
@show_stations_list = "показать список станций"
@show_trains_on_station = "показать список поездов на станции"


def train_move
  forward_status = false
  backward_status = false
  @main.user_trains.each do |train|

    if train.route != nil
      if train.current_station != train.route.stations.last
        forward_status = true
      end

      if train.current_station != train.route.stations.first
        backward_status = true
      end
    end
  end

  puts "-- #{@move_forward}" if forward_status
  puts "-- #{@move_backward}" if backward_status
end

def station_trains
  stations_status = false

  @main.user_stations.each do |station|
    stations_status = true if station.trains.size >= 1
  end

  puts "-- #{@show_trains_on_station}" if stations_status
end

def route_remove_station
  @main.user_routes.each do |route|
    puts "-- #{@remove_station}" if route.stations.size > 2
  end
end

def detach_wagon
  @main.user_trains.each do |train|
    puts "-- #{@detach_wagon}" if train.wagons.size > 0 && @main.user_trains.size >= 1
  end
end

def show_methods
  puts "-- #{@create_station}"
  puts "-- #{@create_train}"
  puts "-- #{@create_route}" if @main.user_stations.size >= 2
  puts "-- #{@add_station}" if @main.user_routes.size >= 1
  route_remove_station
  puts "-- #{@set_route}" if @main.user_trains.size >= 1 && @main.user_routes.size >= 1
  puts "-- #{@attach_wagon}" if @main.user_trains.size >= 1
  detach_wagon
  train_move
  puts "-- #{@show_stations_list}" if @main.user_stations.size >= 1
  station_trains
end

def ask_for_action
  puts "Введите название действия:"
  show_methods
  @user_action = gets.chomp
end

loop do
  puts "-----------------------"
  ask_for_action

  if @user_action == @create_station
    system('clear')
    @main.create_station
  elsif @user_action == @create_train
    system('clear')
    @main.create_train
  elsif @user_action == @create_route
    system('clear')
    @main.create_route
  elsif @user_action == @add_station
    system('clear')
    @main.route_add_station
  elsif @user_action == @remove_station
    system('clear')
    @main.route_remove_station
  elsif @user_action == @set_route
    system('clear')
    @main.train_set_route
  elsif @user_action == @attach_wagon
    system('clear')
    @main.train_attach_wagon
  elsif @user_action == @detach_wagon
    system('clear')
    @main.train_detach_wagon
  elsif @user_action == @move_forward
    system('clear')
    @main.train_move_forward
  elsif @user_action == @move_backward
    system('clear')
    @main.train_move_backward
  elsif @user_action == @show_stations_list
    system('clear')
    @main.show_stations
  elsif @user_action == @show_trains_on_station
    system('clear')
    @main.show_trains_on_station
  else
    break
  end
end





