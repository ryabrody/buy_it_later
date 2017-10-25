class ReceipesController < ApplicationController
  include ReceipeParams
  include IngredientParams

  def new
    @receipe = Receipe.new(receipe_params)
    @receipe.ingredients = []
    @receipe.full_ingredients.each do |full_ingredient|
      @receipe.ingredients << Ingredient.new(ingredient_params(full_ingredient))
    end
  rescue StandardError
     flash[:error] = I18n.t('Not supported')
     redirect_to(action: :index, controller: :ingredients)
  end
end
