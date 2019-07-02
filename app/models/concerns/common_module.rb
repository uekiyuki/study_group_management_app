module CommonModule
  extend ActiveSupport::Concern

  included do
    scope :order_desc, -> { order(created_at: :desc) }
  end
end
