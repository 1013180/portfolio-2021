class Shoe < ApplicationRecord
  has_many :user
  has_many :shoe_images, dependent: :destroy
  accepts_attachments_for :shoe_images, attachment: :image
  belongs_to :shoes_brand
  belongs_to :shoes_size
end
