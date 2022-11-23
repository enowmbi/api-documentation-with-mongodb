class FieldEntry
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :default, type: String
  field :type, type: String

  embedded_in :resource
end
