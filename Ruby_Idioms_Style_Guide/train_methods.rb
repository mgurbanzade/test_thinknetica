module TrainMethods
  def train_set_route
    available_trains = []
    puts OUTPUTS[:created_routes]
    puts list_names(user_routes)
    puts OUTPUTS[:type_route_name]
    user_route_name = gets.chomp

    user_routes.find do |route|
      next unless route.name == user_route_name
      puts OUTPUTS[:available_trains]

      user_trains.each do |train|
        available_trains << "Поезд № #{train.number}" if train.route.nil?
      end

      puts available_trains.join(', ')

      puts OUTPUTS[:train_number]
      user_train_number = gets.chomp

      choosed_train = choose_train(user_trains, user_train_number)
      choosed_train.assign_route(route)
      puts OUTPUTS[:route_assigned]
    end
  end

  def train_attach_wagon
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp

    choosed_train = choose_train(user_trains, user_train_number)

    if choosed_train.type == :passenger
      puts OUTPUTS[:pass_wagon_capacity]
      user_wagon_capacity = gets.chomp.to_i
      choosed_train.attach_wagon(PassengerWagon.new(user_wagon_capacity))

    elsif choosed_train.type == :cargo
      puts OUTPUTS[:cargo_wagon_capacity]
      user_wagon_capacity = gets.chomp.to_f
      choosed_train.attach_wagon(CargoWagon.new(user_wagon_capacity))
    end
    puts OUTPUTS[:wagon_added] unless choosed_train.nil?
  end

  def train_detach_wagon
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.detach_wagon
    puts OUTPUTS[:wagon_detached] unless choosed_train.nil?
  end

  def train_wagons_list
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp
    choosed_train = choose_train(user_trains, user_train_number)

    wagon_info = ->(wagon) { show_wagon_info(wagon) }

    choosed_train.each_wagon(wagon_info)
  end

  def train_use_wagon_space
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp
    choosed_train = choose_train(user_trains, user_train_number)
    puts OUTPUTS[:wagon_number]
    user_wagon_number = gets.chomp.to_i
    choosed_wagon = choosed_train.wagons.find { |wagon| wagon.number == user_wagon_number }

    if choosed_train.type == :passenger
      choosed_wagon.use_space
      puts OUTPUTS[:pass_used_space]
    elsif choosed_train.type == :cargo
      puts OUTPUTS[:cargo_ask_amount]
      user_amount = gets.chomp.to_i
      choosed_wagon.use_space(user_amount)
      puts OUTPUTS[:cargo_used_space]
    end
  end

  def train_move_forward
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.move_next_station
    puts OUTPUTS[:train_has_arrived] + choosed_train.current_station.name unless choosed_train.nil?
  end

  def train_move_backward
    puts OUTPUTS[:available_trains]
    puts trains_list
    puts OUTPUTS[:train_number]
    user_train_number = gets.chomp

    choosed_train = choose_train(user_trains, user_train_number)
    choosed_train.move_previous_station
    puts OUTPUTS[:train_has_arrived] + choosed_train.current_station.name unless choosed_train.nil?
  end
end
