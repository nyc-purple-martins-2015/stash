class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    byebug
    if @photo.save
      render json: @photo.to_json
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo.to_json
  end

  private

  def photo_params
    # restaurant = Restaurant.find_by(name: params[:restaurant][:name])
    params.require(:photo).permit(:image)
  end

end
