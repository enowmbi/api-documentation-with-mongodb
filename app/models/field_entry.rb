class FieldEntry
  include Mongoid::Document
  include CommonField

  embedded_in :resource
end
