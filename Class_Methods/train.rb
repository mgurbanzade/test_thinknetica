require_relative 'manufacturer'

class Train
  attr_reader :number

  @@trains = []

  def self.find(number)
    @@trains.find { |train| train.number == number }
  end

  include Manufacturer

  def initialize(number)
    @number = number
    @@trains << self
  end
end
