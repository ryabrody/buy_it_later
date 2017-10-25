module IngredientParams
  require 'open-uri'

  QUANTITY = '/QUANTITY'
  UNIT = '/UNIT'
  NAME = '/NAME'

  def ingredient_params(full_ingredient)
    labeled_ingredient = open(URI.encode("http://localhost:8080/?ingredient=#{full_ingredient}")).read
    ingredient_elements = labeled_ingredient.split(' ')
    {
      quantity: quantity_from(ingredient_elements),
      unit: unit_from(ingredient_elements),
      name: name_from(ingredient_elements)
    }
  end

  def quantity_from(ingredient_elements)
    quantities = ingredient_elements.select{ |element|  element.include?(QUANTITY) }
    quantities.map { |name| name.delete(QUANTITY) }.join(' ')
  end

  def unit_from(ingredient_elements)
    units = ingredient_elements.select{ |element|  element.include?(UNIT) }
    units.map { |name| name.delete(UNIT) }.join(' ')
  end

  def name_from(ingredient_elements)
    names = ingredient_elements.select{ |element|  element.include?(NAME) }
    names.map { |name| name.delete(NAME) }.join(' ')
  end
end
