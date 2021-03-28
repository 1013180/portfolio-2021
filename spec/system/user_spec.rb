require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
     fill_in 'user[email]', with: user.email
     fill_in 'user[password]', with: user.password

      describe 'ヘッダーのテスト: ログインしている場合' do
       context 'リンクの内容を確認' do
         subject { current_path }

        it 'MyPegeを押すと、自分のユーザ詳細画面に遷移する' do
          user_link = find_all('a')[1].native.inner_text
          user_link = user_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
          click_link user_path(current_user.id)
          is_expected.to eq '/users/' + user_path(current_user.id)
         end
         it 'Usersを押すと、ユーザ一覧画面に遷移する' do
          users_link = find_all('a')[2].native.inner_text
          users_link = users_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
          click_link users_link
          is_expected.to eq '/users'
         end
      end
    end

      describe 'ユーザ一覧画面のテスト' do
      before do
        visit users_path
      end
      context '表示内容の確認' do

        it '自分のユーザ編集画面へのリンクが存在する' do
          expect(page).to have_link '', href: edit_user_path(user)
        end
        it 'URLが正しい' do
          expect(current_path).to eq '/users'
        end
        it '自分と他人の名前がそれぞれ表示される' do
          expect(page).to have_content user.name
          expect(page).to have_content other_user.name
        end
      end
    end
  end
end