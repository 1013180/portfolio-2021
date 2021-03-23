# class ShoesBrandsController < ApplicationController
class ShoeBrandsController < ApplicationController
  def index
    @shoe_brands = ShoeBrand.all.order("id ASC")
    @shoe_brand = ShoeBrand.new
  end

  def create
    # byebug
    @shoe_brand = ShoeBrand.new(shoe_brand_params)
    if @shoe_brand.save
      redirect_to shoe_brands_path
    else
      @shoe_brand = ShoeBrand.all.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
    @shoe_brand = ShoeBrand.find(params[:id])
  end

  def update
    @shoe_brand = ShoeBrand.find(params[:id])
    if @shoe_brand.update(shoe_brand_params)
      redirect_to shoe_brands_path
    else
      render :edit
    end
  end

  private

  def shoe_brand_params
    params.require(:shoe_brand).permit(:brand_name)
  end
end
