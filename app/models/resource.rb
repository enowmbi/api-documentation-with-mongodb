class Resource
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String

  embeds_many :field_entries
  embeds_many :end_points
end
