class Station
  attr_reader :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @@stations << self
  end
end
