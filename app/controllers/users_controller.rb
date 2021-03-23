class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shoes = @user.shoes.all.page(params[:page]).per(5)
    @shoe = Shoe.new
    @plans = Plan.where(user_id: @user.id).where(start_time: Time.current.to_date.beginning_of_day .. Time.current.to_date.end_of_day)
    # byebug
  end

  def index
    @user = User.all.page(params[:page]).per(5)
    @shoes = Shoe.all
    @users = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'successfully'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
