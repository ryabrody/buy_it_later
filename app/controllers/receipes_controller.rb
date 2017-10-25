class ReceipesController < ApplicationController
  def new
    @receipe = Receipe.new
  end
end
