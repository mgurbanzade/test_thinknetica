require_relative 'instance_counter'

class Plane
  include InstanceCounter

  def initialize
    register_instance
  end
end

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

puts Plane.instances

