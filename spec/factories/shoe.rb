# require 'rails_helper'
# require 'spree/testing_support/factories'

FactoryBot.define do
  factory :shoe do
    shoe_model { Faker::Lorem.characters(number:10) }
    description { Faker::Lorem.characters(number:30) }

    #factory :shoe_with_image do
    #  after(:create) do | shoe |
    #    create(:shoe_image, shoe: shoe)
        #create(:after_image, shoe: shoe)
        # 5.times { create(:comment, post: post) }
    #  end
    #end
  end
end