class ShoeBrand < ApplicationRecord
  has_many :shoe
  with_options presence: true do
    validates :brand_name
  end
end
