class FieldEntry
  include Mongoid::Document
  include CommonField
  include DefaultScope

  embedded_in :resource
end
