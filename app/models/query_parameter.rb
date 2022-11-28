class QueryParameter
  include Mongoid::Document
  include CommonField

  field :optional, type: Boolean, default: false
  field :valid_values, type: Array, default: []
  embedded_in :end_point

  default_scope -> { order(_id: :desc) }
end
