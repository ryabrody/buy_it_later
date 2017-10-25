class Receipe < ApplicationRecord
  has_many :ingredients

  attr_accessor :original_ingredients, :original_servings

  accepts_nested_attributes_for :ingredients

  validates :servings, numericality: { greater_than: 0 }
end
