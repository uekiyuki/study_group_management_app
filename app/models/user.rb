class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }

  # Include default devise modules. Others available are:
  # :confirmable :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :event
  has_many :participant_events, through: :participants, source: :event
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # ランダムな文字列を作成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # facebookで認証できるユーザを見つける
  def self.find_for_facebook(auth)
    user = User.find_by(email: auth.info.email)

    user ||= User.new(name: auth.info.name,
                      email: auth.info.email,
                      provider: auth.provider,
                      uid: auth.uid,
                      password: Devise.friendly_token[0, 20])
    user.save
    user
  end

  # ransackで有効な属性を指定
  def self.ransackable_attributes(_auth_object = nil)
    %w[name]
  end

  # ransackで有効なアソシエーションを指定
  def self.ransackable_associations(_auth_object = nil)
    []
  end

  # フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
end
