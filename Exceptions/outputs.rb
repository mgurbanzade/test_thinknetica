PERMITTED_TYPES = ["грузовой", "пассажирский"]

OUTPUTS = {
  station_name: "Придумайте название для станции:",
  station_created: "Создана станция ",
  train_type: "Грузовой или пассажирский?",
  no_type: "Поездов такого типа не сущетсвует. Повторите попытку",
  train_number: "Номер поезда?",
  train_exists: "Поезд с таким номером уже существует. Введите другой номер.",
  pass_train_created: "Пассажирский поезд был успешно создан.",
  cargo_train_created: "Грузовой поезд был успешно создан.",
  stations_list: "Список станций:",
  first_station_name: "Введите название начальной станции:",
  last_station_name: "Введите название конечной станции:",
  route_created: "Маршрут был успешно создан.",
  created_routes: "Список созданных маршрутов:",
  type_route_name: "Введите название маршрута:",
  available_stations: "Список станций которых можно добавить в маршрут:",
  removable_stations: "Список станций которых можно удалить из маршрута:",
  type_station_name: "Введите название станции",
  station_added: "Станция добавлена в маршрут.",
  station_deleted: "Станция удалена из маршрута.",
  available_trains: "Список доступных поездов:",
  route_assigned: "Маршрут назначен.",
  wagon_added: "К поезду был добавлен новый вагон.",
  wagon_detached: "От поезда был отцеплен один вагон.",
  train_has_arrived: "Поезд прибыл на станцию ",
  wrong_format: "Неверный формат"
}

MENU = {
  type_action_name: "Введите название действия:",
  create_station: "создать станцию",
  create_train: "создать поезд",
  create_route: "создать маршрут",
  add_station: "добавить станцию в маршрут",
  remove_station: "удалить станцию из маршрута",
  set_route: "назначить маршрут поезду",
  attach_wagon: "добавить вагон",
  detach_wagon: "отцепить вагон",
  move_forward: "двигаться вперед по маршруту",
  move_backward: "двигаться назад по маршруту",
  show_stations_list: "показать список станций",
  show_trains_on_station: "показать список поездов на станции",
  exit: "выход"
}
