PERMITTED_TYPES = %w[грузовой пассажирский].freeze

OUTPUTS = {
  station_name: 'Придумайте название для станции:',
  station_created: 'Создана станция ',
  train_type: 'Грузовой или пассажирский?',
  no_type: 'Поездов такого типа не сущетсвует. Повторите попытку',
  train_number: 'Номер поезда?',
  train_exists: 'Поезд с таким номером уже существует. Введите другой номер.',
  pass_train_created: 'Пассажирский поезд был успешно создан.',
  cargo_train_created: 'Грузовой поезд был успешно создан.',
  stations_list: 'Список станций:',
  first_station_name: 'Введите название начальной станции:',
  last_station_name: 'Введите название конечной станции:',
  route_created: 'Маршрут был успешно создан.',
  created_routes: 'Список созданных маршрутов:',
  type_route_name: 'Введите название маршрута:',
  available_stations: 'Список станций которых можно добавить в маршрут:',
  removable_stations: 'Список станций которых можно удалить из маршрута:',
  type_station_name: 'Введите название станции',
  station_added: 'Станция добавлена в маршрут.',
  station_deleted: 'Станция удалена из маршрута.',
  available_trains: 'Список доступных поездов:',
  route_assigned: 'Маршрут назначен.',
  wagon_added: 'К поезду был добавлен новый вагон.',
  wagon_detached: 'От поезда был отцеплен один вагон.',
  train_has_arrived: 'Поезд прибыл на станцию ',
  pass_wagon_capacity: 'Укажите количество мест в вагоне.',
  cargo_wagon_capacity: 'Укажите объем вагона (в цифрах).',
  wagon_number: 'Введите номер вагона',
  pass_used_space: '1 место было занято.',
  cargo_ask_amount: 'Какой объем хотите занять в вагоне?',
  cargo_used_space: 'Вы заняли объем в указанном количестве.'
}.freeze

MENU = {
  type_action_name: 'Введите название действия:',
  create_station: 'создать станцию',
  create_train: 'создать поезд',
  create_route: 'создать маршрут',
  add_station: 'добавить станцию в маршрут',
  remove_station: 'удалить станцию из маршрута',
  set_route: 'назначить маршрут поезду',
  attach_wagon: 'добавить вагон',
  detach_wagon: 'отцепить вагон',
  move_forward: 'двигаться вперед по маршруту',
  move_backward: 'двигаться назад по маршруту',
  show_stations_list: 'показать список станций',
  show_trains_on_station: 'показать список поездов на станции',
  show_wagons_list: 'показать вагоны поезда',
  use_wagon_space: 'занять место/объем в вагоне',
  exit: 'выход'
}.freeze

EX_MESSAGES = {
  type_number: 'Поезд не был создан. Вы не ввели номер поезда.',
  wrong_format: 'Неверный формат!',
  train_exists: 'Поезд с таким номером уже существует! Выберите другой номер.',
  type_station_name: 'Станция не была создана. Вы не ввели название станции.',
  route_stations: 'Маршрут не был создан. Выберите станции из списка.'
}.freeze
