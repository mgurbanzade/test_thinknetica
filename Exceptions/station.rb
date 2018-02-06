require_relative 'instance_counter'

class Station
  attr_reader :trains, :name

  NAME_FORMAT = /[а-яА-Я]/

  @@stations = []

  include InstanceCounter

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

  protected

  def validate!
    raise RuntimeError unless name =~ NAME_FORMAT
    true
  end
end
