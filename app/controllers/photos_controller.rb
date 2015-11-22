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

  def index
    @photos = current_user.photos
    render json: @photo.to_json
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo.to_json(methods: [:image_url], :include => { :foodtags => {:only => :description}, :pricetag => {:only => :price}})
  end

  private

  def photo_params
    # maybe find or create by
    restaurant = Restaurant.find_by(name: params[:restaurant])

    params.require(:photo).permit(:image, :dish_name).merge(restaurant_id: restaurant.id)
  end

  def pricetag_params
    params.require(:photo).permit()
  end


  # method to create the associations with the photo
  def foodtag_params
    params.require(:photo).permit()
  end

  # def photo_foodtag_params
  #   params.require(:photo).permit(:foodtag)
  # end

end
