module DefaultScope
  extend ActiveSupport::Concern

  included do
    default_scope -> { order(_id: :desc) }
  end
end
