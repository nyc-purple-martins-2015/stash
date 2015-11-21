class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save

      render json: @photo.to_json
    else
      render :new
    end
  end

  def show
    @photo = Photo.find_by(user: current_user)
    if @photo
      render json: @photo.to_json
    else
      @error = {message: "You don't have any photos! Go out and eat!"}
      render json: @error
    end
  end

  private

  def photo_params
    restaurant = Restaurant.find_by(name: params[:restaurant])
    params.require(:photo).permit(:image).merge(restaurant_id: restaurant.id)
  end

  # def photo_foodtag_params
  #   params.require(:photo).permit(:foodtag)
  # end

end
