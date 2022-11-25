module CommonField
  extend ActiveSupport::Concern

  included do
    field :name, type: String
    field :description, type: String
    field :default, type: String
    field :type, type: String
  end
end
