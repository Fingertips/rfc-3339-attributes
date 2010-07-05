module ActiveRecord
  module RFC3339Attributes
    RFC_3339_REGEXP = /^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d(\.\d*)?(Z|(([+-]\d\d):\d\d))$/
    
    def rfc_3339_attributes(*attr_names)
      attr_names.each do |attr_name|
        define_method "#{attr_name}=" do |time|
          @attributes_cache.delete(attr_name.to_s)
          instance_variable_set("@#{attr_name}_before_type_cast", time)
          
          if time.respond_to?(:in_time_zone)
            time = time.in_time_zone
          elsif parsed_time = Time.zone.parse(time.to_s)
            time = parsed_time.in_time_zone
          end
          
          @attributes[attr_name.to_s] = time
        end
      end
    end
    
    def validates_rf_3339_format_of(*attr_names)
      configuration = {
        :on => :save,
        :with => RFC_3339_REGEXP,
        :message => "should be a valid RFC 3339 timestamp"
      }.update(attr_names.extract_options!)
      
      send(validation_method(configuration[:on] || :save), configuration) do |record|
        attr_names.each do |attr_name|
          value_before_type_cast = record.send(:instance_variable_get, "@#{attr_name}_before_type_cast")
          next if value_before_type_cast.acts_like?(:time)
          if value_before_type_cast.blank? and !configuration[:allow_blank]
            record.errors.add(attr_name, :invalid, :default => "can't be blank", :value => value_before_type_cast)
          elsif value_before_type_cast.to_s !~ configuration[:with]
            record.errors.add(attr_name, :invalid, :default => configuration[:message], :value => value_before_type_cast)
          end
        end
      end
    end
  end
end