class ShoeImage < ApplicationRecord
  belongs_to :shoe
  attachment :before_image
end
