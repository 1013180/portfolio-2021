class UsersController < ApplicationController
  def show
    @shoes = Shoe.all.page(params[:page]).per(10)
  end

  def index
   @user = User.all
   @shoes = Shoe.all
  end

  def edit
  end

  def user_params
   params.require(:user).permit(:name, :profile_image)
  end
end
