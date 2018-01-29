require_relative 'station'
require_relative 'routes'
require_relative 'train'

baku = Station.new('Бакинский Вокзал')
moscow = Station.new('Московский Вокзал')
rostov = Station.new('Ростов-Главный')

baku_moscow = Route.new(baku, moscow)
baku_moscow.add_station(rostov)

maglev = Train.new(1, 'пассажирский', 15)

maglev.set_route(baku_moscow)
