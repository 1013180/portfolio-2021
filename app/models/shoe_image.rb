class ShoeImage < ApplicationRecord
  belongs_to :shoe
  attachment :image
end
