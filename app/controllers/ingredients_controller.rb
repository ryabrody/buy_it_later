class IngredientsController < ApplicationController
  before_action :create_receipe, only: [:create]

  def index
    @ingredients = Ingredient.all
    @ingredient = Ingredient.new
  end

  def create
    @ingredients = Ingredient.all
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    render :index
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def create_receipe
    return unless params[:ingredient][:name] =~ URI::regexp
    redirect_to new_receipe_path(url: params[:ingredient][:name])
  end
end
