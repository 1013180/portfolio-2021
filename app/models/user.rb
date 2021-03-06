class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image, destroy: false

  has_many :shoes
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :plans
  validates :name, length: { maximum: 20, minimum: 2 }, uniqueness: true, presence: true
  validates :introduction,
            length: { maximum: 50 }
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
