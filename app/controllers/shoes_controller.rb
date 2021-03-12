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
    if params[:q]
     @search = Shoe.ransack(params[:q]) #ransackの検索メソッド
     @shoes = @search.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page]).per(5)
     pp @shoes
    else
     @shoes = Shoe.all.page(params[:page]).per(10)
    end
  end

  def show
     @shoe = Shoe.find(params[:id])
     @comment = Comment.new
     @comments = @shoe.comments.order(created_at: :desc)
     @favorite = @shoe.favorites.find_by(user_id: current_user.id)
  end



  def destroy
  end
  private



  def shoe_params
    params.require(:shoe).permit(:shoes_models, :description, :shoe_model, :shoe_brand_id, :shoe_size_id, shoe_images_before_images:[], after_images_after_images:[])
  end
end
