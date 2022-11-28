class EndPoint
  include Mongoid::Document
  include DefaultScope

  field :name, type: String
  field :http_method, type: String
  field :description, type: String

  embeds_many :query_parameters
  embedded_in :resource
end
