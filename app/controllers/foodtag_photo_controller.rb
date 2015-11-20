class FoodtagPhotoController < ApplicationController

  def new
    @foodtag_photo = FoodtagPhoto.new
  end

  def create
    @foodtag_photo = FoodtagPhoto.new(foodtag_photo_params)
    if @foodtag_photo.save
      #render something?
    else
      #stay on photo saving page
    end
  end

  def show_foodtag_photos
    foodtag_photos = Photos.where( foodtag: foodtag_photo_params[:foodtag] )

    foodtag_photos = foodtag_photos.map { |photo| photo.image }
    render json: foodtag_photos.to_json
  end

  private

  def foodtag_photo_params
    params.require(:foodtag_photo).permit(:photo_id, :foodtag)
  end


end
