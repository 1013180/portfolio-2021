class FavoritesController < ApplicationController
  def create
    @shoe = Shoe.find(params[:shoe_id])
    favorite = current_user.favorites.new(shoe_id: @shoe.id)
    favorite.save
  end

  def destroy
    @shoe = Shoe.find(params[:shoe_id])
    favorite = current_user.favorites.find_by(shoe_id: @shoe.id)
    favorite.destroy
  end
end
