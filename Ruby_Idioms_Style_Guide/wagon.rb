require_relative 'manufacturer'
require_relative 'instance_counter'

class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :type, :number, :total_space
  attr_accessor :used_space

  def initialize(args)
    @number = self.class.instances.to_i + 1
    @total_space = args
    @used_space = 0
    @available_space = args
    register_instance
  end

  def use_space(amount)
    self.used_space += amount if amount <= available_space
  end

  def available_space
    total_space - used_space
  end
end
