class Shoe < ApplicationRecord
  belongs_to :user
  has_many :shoe_images, dependent: :destroy
  has_many :after_images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_attachments_for :shoe_images, attachment: :before_image
  accepts_attachments_for :after_images, attachment: :after_image
  belongs_to :shoe_brand, optional: true
  belongs_to :shoe_size, optional: true
  validates :shoe_model, length: { maximum: 50, minimum: 2 }, uniqueness: true, presence: true
  validates :description, length: { maximum: 200 }
  validates :shoe_images, presence: true
  validates :after_images, presence: true
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
