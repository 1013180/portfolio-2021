class PlansController < ApplicationController
  def index
    @plans = Plan.where(user_id: current_user)
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
    # @plans = Plan.all.page(params[:page]).per(5)
  end

  def create
    @plan = Plan.new(plan_parameter)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to plan_path(@plan)
    else
      render :new
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path, notice: '削除しました'
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_parameter)
      redirect_to plans_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def plan_parameter
    params.require(:plan).permit(:title, :content, :start_time)
  end
end
