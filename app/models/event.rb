class Event < ApplicationRecord
  include CommonModule
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  paginates_per 10
  has_one_attached :image
  has_many :favorite_users, through: :favorites, source: :user
  has_many :participant_users, through: :participants, source: :user
  acts_as_taggable

  def self.ransackable_attributes(_auth_object = nil)
    %w[title content created_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[user]
  end
end
