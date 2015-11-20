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
    restaurant = Restaurant.find_by(name: params[:restaurant][:name])
    params.require(:photo).permit(:image)
  end

end
