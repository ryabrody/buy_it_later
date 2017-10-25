class Ingredient < ApplicationRecord
  belongs_to :receipe, required: false

  attr_accessor :original_servings

  validates :name, presence: true

end
