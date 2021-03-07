class ShoesController < ApplicationController
  def new
    #byebug
    @shoe = Shoe.new
    @shoe.shoe_images.build
    @shoes_brand = ShoesBrand.all
  end

  def create
    @shoe  = Shoe.new(shoe_params)
    if @shoe.save
    redirect_to new_shoe_path
    else
    render :new
    end
  end

  def index
    @shoes = Shoe.all.page(params[:page]).per(10)
  end

  def show
     @shoes = Shoe.find(params[:id])
  end

  def destroy
  end
  private

  def shoe_params
    params.require(:shoe).permit(:shoes_models, :description, shoe_images_images: [])
  end
end
