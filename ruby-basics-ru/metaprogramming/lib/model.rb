# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    @@scheme = []

    def base.attribute(name, options = {})
      @@scheme.push name
      define_method name do
        instance_variable_get "@#{name}"
      end

      define_method "#{name}=" do |value|
        if value.nil?
          instance_variable_set "@#{name}", value
          return
        end
        case options[:type]
        when :integer
          value = value.to_i
        when :string
          value = value.to_s
        when :datetime
          value = DateTime.parse(value)
        when :boolean
          value = value.to_bool unless [true, false].include? value
        else
          value
        end
        instance_variable_set "@#{name}", value
      end
    end
  end

  def initialize(attributes = {})
    attributes.each do |k, v|
      send("#{k}=", v)
    end
  end

  def attributes
    @@scheme.to_h { |k| [k, instance_variable_get("@#{k}")] }
  end
end
# END
