module ReceipeParams
  TASTY_HOST = 'tasty.co'

  def receipe_params
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
      servings: tasty.servings,

      # ingredients will get stored
      # as Ingredient record and not into
      # as Receipe record
      full_ingredients: tasty.full_ingredients
    }
  end
end
