class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new, @photo.to_json
    end
  end

  def show
    @photo = Photo.find(params[:id])
    render :show, @photo.to_json
    redirect_to photo_path(@photo)
  end

  private

  def photo_params
    restaurant_id = Retaurant.find_by(params[:restaurant][:name])
    params.require(:photo).permit(:image).merge(restaurant_id: restaurant_id, lng: from_swift, lat: from_swift)
  end

end
