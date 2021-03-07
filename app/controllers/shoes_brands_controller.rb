class ShoesBrandsController < ApplicationController

  def index
    @shoes_brands = ShoesBrand.all.page(params[:page]).per(10)
    @shoes_brand = ShoesBrand.new
  end

  def create
    #byebug
    @shoes_brand = ShoesBrand.new(shoes_brand_params)
    if @shoes_brand.save
    redirect_to shoes_brands_path
    else
    @shoes_brand = ShoesBrand.all.page(params[:page]).per(10)
    render :index
    end
  end

  def edit
    @shoes_brand = ShoesBrand.find(params[:id])
  end

  def update
    @shoes_brand = ShoesBrand.find(params[:id])
    if @shoes_brand.update(shoes_brand_params)
    redirect_to shoes_brands_path
    else
    render :edit
    end
  end


  private
  def shoes_brand_params
    params.require(:shoes_brand).permit(:brand_name)
  end
end

