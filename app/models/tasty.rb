class Tasty
  require 'open-uri'

  attr_reader :meta_data

  def initialize(url)
    page = Nokogiri::HTML(open(url))
    data = page.at("script[type='application/ld+json']")
    useful_data = data.children.first.content
    @meta_data = JSON.parse(useful_data).with_indifferent_access
  end

  def image
    meta_data[:image]
  end

  def name
    meta_data[:name]
  end

  def servings
    meta_data[:recipeYield].delete(' servings').to_i
  end

  def original_ingredients
    meta_data[:recipeIngredient]
  end
end
