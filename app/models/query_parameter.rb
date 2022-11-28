class QueryParameter
  include Mongoid::Document
  include CommonField
  include DefaultScope

  field :optional, type: Boolean, default: false
  field :valid_values, type: Array, default: []
  embedded_in :end_point
end
