require_relative 'manufacturer'
require_relative 'instance_counter'

class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :type

  def initialize
    register_instance
  end
end
