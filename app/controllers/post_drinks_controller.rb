class PostDrinksController < ApplicationController
  def index
    @post_drinks = PostDrink.all
    @post_drinks = @post_drinks.where('genre LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @post_drink = PostDrink.find(params[:id])
  end

  def new
    @post_drink = PostDrink.new
  end

  def create
    @post_drink = PostDrink.new(post_drink_params)
    @post_drink.user_id = current_user.id
    @post_drink.save
    redirect_to post_drinks_path
  end

  def edit
    @post_drink = PostDrink.find(params[:id])
  end

  def update
    post_drink = PostDrink.find(params[:id])
    post_drink.update(post_drink_params)
    redirect_to post_drink_path(post_drink.id)
  end

  def destroy
    @post_drink = PostDrink.find(params[:id])
    @post_drink.destroy
    redirect_to post_drinks_path
  end

  private

  def post_drink_params
    params.require(:post_drink).permit(:name, :introduction, :genre, :user_id, :image)
  end
end
