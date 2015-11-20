class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to photo_path
    else
      render :new, @photo.to_json
    end
  end

  def show
  end

  private

  def photo_params
    restaurant_id = Retaurant.find_by(params[:restaurant_name])
    params.require(:photo).permit(:image, :lng, :lat).merge(restaurant_id: restaurant_id)
  end

end
