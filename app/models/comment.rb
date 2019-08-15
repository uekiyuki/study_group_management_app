class Comment < ApplicationRecord
  include CommonModule
  belongs_to :event
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
end
