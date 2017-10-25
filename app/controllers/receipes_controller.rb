class ReceipesController < ApplicationController
  def create
    binding.pry
    @receipe = Receipe.new
  end
end
