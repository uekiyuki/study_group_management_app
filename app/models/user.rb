class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy


  def self.ransackable_attributes(_auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

end
