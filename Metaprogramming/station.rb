require_relative 'instance_counter'
require_relative 'outputs'
require_relative 'validation'
require_relative 'accessors'

class Station
  include InstanceCounter
  include Validation
  include Accessors

  NAME_FORMAT = /[а-яА-Я]/

  attr_reader :trains, :name

  attr_accessor_with_history :station_area
  strong_attr_accessor :station_name, String

  validate :name, :type, String
  validate :name, :presence
  validate :name, :format, NAME_FORMAT


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

  def empty?
    false
  end
end
