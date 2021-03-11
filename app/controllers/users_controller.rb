class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shoes = @user.shoes
    @shoe = Shoe.new
  end

  def index
   @user = User.all
   @shoes = Shoe.all
   @users = current_user
  end

  def edit
  end
  
  def search
  end

  def user_params
   params.require(:user).permit(:name, :profile_image)
  end
end
