class ShoesBrand < ApplicationRecord
   has_many :shoes
   with_options presence: true do
   validates :brand_name
end
end