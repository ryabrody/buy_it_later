module IngredientParamsValues
  require 'open-uri'

  QUANTITY = '/QUANTITY'
  UNIT = '/UNIT'
  NAME = '/NAME'

  def ingredient_params_values(original_ingredient)
    labeled_ingredient = open(URI.encode("http://localhost:8080/?ingredient=#{original_ingredient}")).read
    ingredient_elements = labeled_ingredient.split(' ')
    {
      quantity: quantity_from(ingredient_elements),
      unit: unit_from(ingredient_elements),
      name: name_from(ingredient_elements)
    }
  end

  def quantity_from(ingredient_elements)
    quantities = ingredient_elements.select{ |element|  element.include?(QUANTITY) }
    quantity = quantities.map { |name| name.gsub(QUANTITY, '') }.join(' ')
    convert(quantity)
  end

  def unit_from(ingredient_elements)
    units = ingredient_elements.select{ |element|  element.include?(UNIT) }
    units.map { |name| name.gsub(UNIT, '') }.join(' ')
  end

  def name_from(ingredient_elements)
    names = ingredient_elements.select{ |element|  element.include?(NAME) }
    names.map { |name| name.gsub(NAME, '') }.join(' ')
  end

  def convert(quantity)
    if quantity == '1/2'
      0.5.to_d
    elsif quantity == '1/4'
      0.25.to_d
    else
      quantity
    end
  end
end
