class IngredientsController < ApplicationController
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
end
