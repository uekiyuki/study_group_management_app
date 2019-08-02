class Event < ApplicationRecord
  include CommonModule
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  paginates_per 12

  has_one_attached :image
  has_many :favorite_users, through: :favorites, source: :user
  has_many :participant_users, through: :participants, source: :user
  acts_as_taggable

  # ransackで有効な属性を指定
  def self.ransackable_attributes(_auth_object = nil)
    %w[title content created_at]
  end

  # ransackで有効なアソシエーションを指定
  def self.ransackable_associations(_auth_object = nil)
    %w[user]
  end

  # 初期登録Eventを抽出
  def self.find_test_event
    Event.find(1)
  end

  # 画像のリサイズ
  def image_resize(size)
    image.variant(resize: "#{size}x#{size}").processed
  end

  # 画像の表示
  def indicate_image
    image.attached? ? image_tag(image_resize(200)) : image_tag(Event.find_test_event.image_resize(200))
  end
end
