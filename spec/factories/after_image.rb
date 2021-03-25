FactoryBot.define do
  factory :after_image do
    association :shoe, factory: :shoe
    after_image_id { "1" }
  end
end