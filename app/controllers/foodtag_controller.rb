class FoodtagsController < ApplicationController

  def new
    @foodtag = Foodtag.new
  end

  def create
    @foodtag = Foodtag.new(foodtag_params)
  end

  private

  def foodtag_params
    params.require(:foodtag).permit(:description)
  end

end
