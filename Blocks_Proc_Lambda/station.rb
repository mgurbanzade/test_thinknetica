require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  NAME_FORMAT = /[а-яА-Я]/

  attr_reader :trains, :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def train_arrival(train)
    trains << train
  end

  def train_departure(train)
    trains.delete(train)
  end

  def train_types(type)
    trains.count { |train| train.type == type }
  end

  def each_train(block)
    trains.each { |train| block.call(train) }
  end

  protected

  def validate!
    raise EX_MESSAGES[:type_station_name] if name.empty?
    raise EX_MESSAGES[:wrong_format] unless name =~ NAME_FORMAT
    true
  end
end
