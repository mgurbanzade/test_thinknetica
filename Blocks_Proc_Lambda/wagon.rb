require_relative 'manufacturer'
require_relative 'instance_counter'

class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :type, :number
  attr_accessor :used_space, :available_space

  def initialize(args)
    @number = self.class.instances.to_i + 1
    @used_space = 0
    @available_space = args
    register_instance
  end

  def use_space(amount)
    self.used_space += amount if amount < available_space
    self.available_space -= amount
  end
end
