

FactoryBot.define do
  factory :shoe do

    shoe_model { Faker::Lorem.characters(number:10) }
    shoe_size
    shoe_brand
    user

    before(:create) do |shoe|
      shoe.shoe_images << FactoryBot.build(:shoe_image, shoe: shoe)
    end

    before(:create) do |shoe|
      shoe.after_images << FactoryBot.build(:after_image, shoe: shoe)
    end
  end
end
