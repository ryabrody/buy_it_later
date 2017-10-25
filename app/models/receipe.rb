class Receipe < ApplicationRecord
  has_many :ingredients

  attr_accessor :full_ingredients

  accepts_nested_attributes_for :ingredients
end
