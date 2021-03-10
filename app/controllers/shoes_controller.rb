class ShoesController < ApplicationController
  def new
    #byebug
    @shoe = Shoe.new
    @shoe.shoe_images.build
    @shoe_brand = ShoeBrand.all
    @shoe_size = ShoeSize.all
  end

  def create
    @shoe  = Shoe.new(shoe_params)
    @shoe.user_id = current_user.id
    if @shoe.save
    redirect_to shoe_path(@shoe)
    else
    render :new
    end
  end

  def index
    @shoes = Shoe.all.page(params[:page]).per(10)
  end

  def show
     @shoe = Shoe.find(params[:id])
     @comment = Comment.new
     @comments = @shoe.comments.order(created_at: :desc)
  end

  def destroy
  end
  private

  def shoe_params
    params.require(:shoe).permit(:shoes_models, :description, :shoe_model, :shoe_brand_id, :shoe_size_id, shoe_images_before_images:[], after_images_after_images:[])
  end
end
