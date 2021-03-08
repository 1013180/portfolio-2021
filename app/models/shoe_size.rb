class ShoeSize < ApplicationRecord
  has_many :shoe
  with_options presence: true do
  validates :size
end
end