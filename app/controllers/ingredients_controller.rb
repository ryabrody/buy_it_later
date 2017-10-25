class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @receipe = Receipe.new
  end
end
