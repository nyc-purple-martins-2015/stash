class FoodtagPhotosController < ApplicationController
  def index

  end

  def new
    @foodtag_photo = FoodtagPhoto.new
  end

  def create
    @foodtag_photo = FoodtagPhoto.new(foodtag_photo_params)
    if @foodtag_photo.save
      render json: @foodtag_photo.to_json
      #render something?
    else
      render :new
      #stay on photo saving page
    end
  end


  private

  def foodtag_photo_params
    params.require(:foodtag_photo).permit(:photo_id, :foodtag)
  end


end
