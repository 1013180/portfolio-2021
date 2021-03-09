class Shoe < ApplicationRecord
  has_many :user
  has_many :shoe_images, dependent: :destroy
  accepts_attachments_for :shoe_images, attachment: :before_image
  accepts_attachments_for :shoe_images, attachment: :after_image
  belongs_to :shoe_brands, optional: true
  belongs_to :shoe_sizes, optional: true
end
