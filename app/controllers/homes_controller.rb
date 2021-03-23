class HomesController < ApplicationController
  def top; end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'guest') do |u|
      u.password = SecureRandom.urlsafe_base64
  end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
