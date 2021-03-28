require 'rails_helper'

describe 'Userモデルのテスト' do
  let(:user) { create(:user) }

  it "名、メール、パスワードがある場合、有効である" do
    user = User.new(
     name: "test",
     email: "test@example.com",
     password: "password",
     )
     expect(user).to be_valid
  end

  it "名がない場合、無効である" do
    user = User.new(
      email: "test@example.com",
      password: "password",
    )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "パスワードがない場合、無効である" do
    user = FactoryBot.build(:user)
    user.password = "" # パスワードがない状態を再現するために空を代入している
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end