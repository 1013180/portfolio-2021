class ShoeSizesController < ApplicationController
  def index
    @shoe_sizes = ShoeSize.all.page(params[:page]).per(10)
    @shoe_size = ShoeSize.new
  end

  def create
    # byebug
    @shoe_size = ShoeSize.new(shoe_size_params)
    if @shoe_size.save
      redirect_to shoe_sizes_path
    else
      @shoe_size = ShoeSize.all.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
    @shoe_size = ShoeSize.find(params[:id])
  end

  def update
    @shoe_size = ShoeSize.find(params[:id])
    if @shoe_size.update(shoe_size_params)
      redirect_to shoe_sizes_path
    else
      render :edit
    end
  end

  private

  def shoe_size_params
    params.require(:shoe_size).permit(:size)
  end
end
