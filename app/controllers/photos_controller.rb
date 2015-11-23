class PhotosController < ApplicationController

  def new
    # You could probably just do Photo.new here
    @photo = current_user.photos.new
  end

  def create
    restaurant = Restaurant.find_or_create_by(name: restaurant_params[:restaurant])
    @photo = current_user.photos.new(image: photo_params[:image], dish_name: photo_params[:dish_name], lat: photo_params[:lat].to_f, lng: photo_params[:lng].to_f, restaurant: restaurant)
    if @photo.save
      # Be careful here - you migth create new pricetags, but you probably know 
      # upfront what the population of pricetags is
      @photo.pricetag = Pricetag.find_or_create_by(price: params[:pricetag])
      @photo.associate_to_foodtags(foodtag_params[:foodtags].split(","))
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo.to_json(methods: [:image_url], :include => { :foodtags => {:only => :description}, :pricetag => {:only => :price}})
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :dish_name, :lat, :lng)
  end

  # You don't need this if you name the params to use on the create calle
  def pricetag_params
    params.require(:photo).permit(:pricetag)
  end

  def restaurant_params
    params.require(:photo).permit(:restaurant)
  end

  def foodtag_params
    params.require(:photo).permit(:foodtags)
  end

  # def photo_foodtag_params
  #   params.require(:photo).permit(:foodtag)
  # end

end
