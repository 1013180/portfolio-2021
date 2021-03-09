class ShoeImage < ApplicationRecord
  belongs_to :shoe
  attachment :before_image
  attachment :after_image
end
