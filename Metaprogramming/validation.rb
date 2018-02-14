module Validation
  class << self
    def included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_reader :validations

      def validate(name, validation, *params)
        @validations ||= []
        @validations << {name: name, validation: validation, params: params}
      end
    end

    module InstanceMethods
      def validate!
        self.class.validations.each do |hash|
          value = instance_variable_get("@#{hash[:name]}")
          send("validate_#{hash[:validation]}", value, *hash[:params])
        end
        true
      end

      def valid?
        validate!
      rescue RuntimeError
        false
      end

      private

      def validate_presence(attr_name)
        raise EX_MESSAGES[:type_number] if attr_name.nil? || attr_name.empty?
      end

      def validate_format(attr_name, format)
        raise EX_MESSAGES[:wrong_format] if attr_name !~ format
      end

      def validate_type(attr_name, type)
        raise EX_MESSAGES[:wrong_type] if !attr_name.kind_of? type
      end
    end
  end
end
