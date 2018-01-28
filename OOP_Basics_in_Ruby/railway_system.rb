require_relative '1_station'
require_relative '2_routes'
require_relative '3_train'

baku = Station.new('Бакинский Вокзал')
moscow = Station.new('Московский Вокзал')
rostov = Station.new('Ростов-Главный')
voronezh = Station.new('Воронеж I')

baku_moscow = Route.new(baku, moscow)
baku_moscow.add_station(rostov)

maglev = Train.new(1, 'пассажирский', 15)
maglev.get_route(baku_moscow)

#STATION

#Имеет название, которое указывается при ее создании
baku.name

#Может принимать поезда (по одному за раз)
rostov.train_arrival(maglev)

#Может возвращать список всех поездов на станции, находящиеся в текущий момент
rostov.trains

#Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
rostov.train_types

#Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
rostov.train_departure(maglev)


#ROUTE

#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
puts "Начальная: #{baku_moscow.stations.first.name}, промежуточная(ые): #{baku_moscow.stations[1].name}, конечная: #{baku_moscow.stations.last.name}."

#Может добавлять промежуточную станцию в список
#baku_moscow.add_station(rostov)

#Может удалять промежуточную станцию из списка
#baku_moscow.remove_station(rostov)

#Может выводить список всех станций по-порядку от начальной до конечной
baku_moscow.stations

#TRAIN

#Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
maglev.number
maglev.type
maglev.wagons

#Может набирать скорость
maglev.accelerate(100)

#Может возвращать текущую скорость
maglev.speed

#Может тормозить (сбрасывать скорость до нуля)
maglev.stop

#Может возвращать количество вагонов
maglev.wagons

#Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
maglev.attach_wagon
maglev.detach_wagon

#Может принимать маршрут следования (объект класса Route).
#maglev.get_route(baku_moscow)

#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
maglev.current_station

#Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
#maglev.move_forward(baku_moscow)
#maglev.move_backward(baku_moscow)

#Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
maglev.prev_station(baku_moscow)
maglev.current_station
maglev.next_station(baku_moscow)



