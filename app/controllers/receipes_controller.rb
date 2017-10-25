class ReceipesController < ApplicationController
  include ReceipeParamsValues
  include IngredientParamsValues

  def new
    @receipe = Receipe.new(receipe_params_values)
    @receipe.ingredients = []
    @receipe.original_ingredients.each do |original_ingredient|
      @receipe.ingredients << Ingredient.new(ingredient_params_values(original_ingredient))
    end
  end

  def create
    @receipe = Receipe.new(receipe_params)
    if @receipe.valid?
      @receipe.ingredients.each do |ingredient|
        ingredient.quantity = calculate_quantity(ingredient.quantity, @receipe.original_servings, @receipe.servings)
      end
      @receipe.save
      redirect_to(action: :index, controller: :ingredients)
    else
      render :new
    end
  end

  def receipe_params
    params.require(:receipe).permit(:url, :image, :name, :servings, :original_servings, ingredients_attributes:
                                      [:id, :name, :unit, :quantity, :servings]
                                   )
  end

  private

  def calculate_quantity(quantity, original_servings, new_servings)
    quantity_for_one = quantity / original_servings.to_i
    quantity_for_one * new_servings
  end
end
