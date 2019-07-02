class Comment < ApplicationRecord
  include CommonModule
  belongs_to :event
  belongs_to :user
end
