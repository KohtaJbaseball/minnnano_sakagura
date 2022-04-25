class FavoritesController < ApplicationController

  def create
    post_drink = PostDrink.find(params[:post_drink_id])
    favorite = current_user.favorites.new(post_drink_id: post_drink.id)
    favorite.save
    redirect_to post_drink_path(post_drink)
  end

  def destroy
    post_drink = PostDrink.find(params[:post_drink_id])
    favorite = current_user.favorites.find_by(post_drink_id: post_drink.id)
    favorite.destroy
    redirect_to post_drink_path(post_drink)
  end

end
