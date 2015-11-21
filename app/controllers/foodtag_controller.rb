class FoodtagsController < ApplicationController

  def new
    @foodtag = Foodtag.new
  end

  def create
    @foodtag = Foodtag.new(foodtag_params)
    if @foodtag.save
      render json: @foodtag.to_json
    else
      render :new
    end
  end

  def show
    @foodtag = Foodtag.find_by(description: foodtag_params)
    render json: @foodtag.to_json
  end

  private

  def foodtag_params
    params.require(:foodtag).permit(:description)
  end

end
