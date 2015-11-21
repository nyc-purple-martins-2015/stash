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
    @photo = Photo.find(params[:id])
    url = @photo.image.url
    pricetag = @photo.pricetag.price
    # @photo.merge(pricetag)
    foodtags = @photo.foodtags
    object = [@photo, pricetag, foodtags]
    render json: object.to_json
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
