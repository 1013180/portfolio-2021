FactoryBot.define do
  factory :shoe_image do
    association :shoe, factory: :shoe
    before_image_id { "1" }
  end
end