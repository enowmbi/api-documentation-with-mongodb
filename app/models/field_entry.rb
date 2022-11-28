class FieldEntry
  include Mongoid::Document
  include CommonField

  embedded_in :resource

  default_scope -> { order(_id: :desc) }
end
