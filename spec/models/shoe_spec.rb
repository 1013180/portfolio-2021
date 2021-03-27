require 'rails_helper'

describe 'Shoeモデルのテスト' do
  let(:user) { create(:user) }
  let(:shoe_brand) { create(:shoe_brand) }
  let(:shoe_size) { create(:shoe_size) }
  let(:shoe_image) { build(:shoe_image) }
  let(:after_image) { build(:after_image) }


  it "有効な投稿内容の場合は保存されるか" do
    shoe = build(:shoe, user: user, shoe_brand: shoe_brand, shoe_size: shoe_size)
    shoe.shoe_images.build(shoe_image.attributes)
     shoe.after_images.build(after_image.attributes)
    expect(shoe).to be_valid
  end
end