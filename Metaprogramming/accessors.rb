module Accessors
  class << self
    def included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def attr_accessor_with_history(*names)
        names.each do |name|
          define_method(name) { instance_variable_get("@#{name}") }
          define_method("#{name}=") do |value|
            instance_variable_set("@#{name}", value)
            history = (instance_variable_get("@#{name}_history") || [])
            instance_variable_set("@#{name}_history", history << value)
          end

          define_method("#{name}_history") { instance_variable_get("@#{name}_history") }
        end
      end

      def strong_attr_accessor(attr_name, class_name)
        define_method(attr_name) { instance_variable_get("@#{attr_name}") }
        define_method("#{attr_name}=") do |value|
          raise TypeError unless value.kind_of? class_name
          instance_variable_set("@#{attr_name}", value)
        end
      end
    end
  end
end
