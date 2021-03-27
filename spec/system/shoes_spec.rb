require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
     fill_in 'user[email]', with: user.email
     fill_in 'user[password]', with: user.password
  let(:shoe) { create(:shoe) }

  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に「ShoesProud」が表示されているか' do
        expect(page).to have_content 'ShoesProud'
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "投稿画面(new_shoe_path)のテスト" do
    before do
      visit new_shoe_path
    end
    context '表示の確認' do
      it 'new_shoe_pathが"/shoes/new"であるか' do
        expect(current_path).to eq('/shoes/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '新規登録'
      end
    end
     context '投稿処理のテスト' do
       it '投稿後のリダイレクト先は正しいか' do
         fill_in 'shoe[shoe_model]', with: Faker::Lorem.characters(number:5)
         fill_in 'shoe[description]', with: Faker::Lorem.characters(number:20)
         click_button '新規登録'
        expect(page).to have_current_path shoe_path(Shoe.last)
       end
     end
  end

 describe "投稿一覧のテスト" do
     before do
       visit shoes_path
     end
     context '表示の確認' do
       it '投稿されたものが表示されているか' do
         expect(page).to have_content shoe.shoe_model
         expect(page).to have_link shoe.shoe_model
       end
     end
   end

  describe "詳細画面のテスト" do
    before do
      visit shoe_path(shoe)
    end
    context '表示の確認' do
      it '削除リンクが存在しているか' do
        expect(page).to have_link '投稿を削除する'
      end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '投稿を編集する'
      end
    end
    context 'リンクの遷移先の確認' do
      it '編集の遷移先は編集画面か' do
        edit_link = find_all('a')[0]
        edit_link.click
        expect(current_path).to eq('/shoes/' + shoes.id.to_s + '/edit')
      end
    end
    context 'shoe削除のテスト' do
      it 'shoeの削除' do
        expect{ shoe.destroy }.to change{ Shoe.count }.by(-1)
      end
    end
  end

   describe '編集画面のテスト' do
    before do
      visit edit_shoe_path(shoe)
     end
     context '表示の確認' do
       it '編集前のタイトルと本文がフォームに表示(セット)されている' do
         expect(page).to have_field 'shoe[shoe_model]', with: shoe.shoe_model
         expect(page).to have_field 'shoe[description]', with: shoe.description
       end
       it '保存ボタンが表示される' do
         expect(page).to have_button '変更を保存'
       end
     end
     context '更新処理に関するテスト' do
       it '更新後のリダイレクト先は正しいか' do
        fill_in 'shoe[shoe_model]', with: Faker::Lorem.characters(number:5)
        fill_in 'shoe[description]', with: Faker::Lorem.characters(number:20)
        click_button '投稿を編集する'
        expect(page).to have_current_path shoe_path(shoe)
       end
    end
  end
end
end