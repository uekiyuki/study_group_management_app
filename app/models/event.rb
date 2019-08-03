class Event < ApplicationRecord
  include CommonModule
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_many :favorite_users, through: :favorites, source: :user
  has_many :participant_users, through: :participants, source: :user
  acts_as_taggable

  paginates_per 12

  validates :title, presence: true, length: { in: 1..32 }
  validates :location, presence: true, length: { maximum: 32 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :event_at, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :expiration_date_cannot_be_in_the_past

  # 過去の開催日は許容しないバリデーション
  def expiration_date_cannot_be_in_the_past
    errors.add(:event_at, 'は過去の日付は使えません') if event_at.present? && event_at < Date.today
  end

  # ransackで有効な属性を指定
  def self.ransackable_attributes(_auth_object = nil)
    %w[title content created_at]
  end

  # ransackで有効なアソシエーションを指定
  def self.ransackable_associations(_auth_object = nil)
    %w[user]
  end

  # 画像のリサイズ
  def image_resize(size)
    image.variant(resize: "#{size}x#{size}").processed
  end
end
