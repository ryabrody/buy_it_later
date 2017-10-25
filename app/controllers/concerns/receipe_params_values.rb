module ReceipeParamsValues
  TASTY_HOST = 'tasty.co'

  def receipe_params_values
    url = URI(params[:url])
    if url.host == TASTY_HOST
      tasty_receipe_prams
    end
  end

  private

  def tasty_receipe_prams
    tasty = ::Tasty.new(params[:url])
    {
      url: params[:url],
      image: tasty.image,
      name: tasty.name,

      # we put tasty.servings as proposal 
      # to have a default value
      servings: tasty.servings,
      original_servings: tasty.servings,

      # ingredients will get stored
      # as Ingredient record and not into
      # as Receipe record
      original_ingredients: tasty.original_ingredients
    }
  end
end
