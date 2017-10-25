class Ingredient < ApplicationRecord
  belongs_to :receipe, required: false

  validates :name, presence: true
end
