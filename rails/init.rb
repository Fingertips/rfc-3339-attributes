require 'active_record/rfc_3339_attributes'
ActiveRecord::Base.send(:extend, ActiveRecord::RFC3339Attributes)