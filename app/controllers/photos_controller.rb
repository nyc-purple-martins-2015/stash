class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(image: photo_params[:image], dish_name: photo_params[:dish_name], lat: photo_params[:lat].to_f, lng: photo_params[:lng].to_f, restaurant: photo_params[:restaurant], restaurant_address: photo_params[:restaurant_address])
    if @photo.save
      @photo.pricetag = Pricetag.find_by(price: params[:photo][:pricetag])
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

  def edit
    @photo = Photo.find(params[:id])
    foodtags = []

    if @photo.dish_name == nil
      @photo.dish_name = "You didn't provide a dish name."
    end

    if @photo.foodtags
      for tag in @photo.foodtags
        foodtags << tag.description
      end
    end

    @photo_foodtags = foodtags.join(", ")
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.assign_attributes(params)
    if @photo.save
      redirect_to user_path(current_user)
    else
      @error = "Your was unable to be saved."
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(current_user)
  end


  private

  def photo_params
    params.require(:photo).permit(:image, :dish_name, :lat, :lng, :restaurant, :restaurant_address)
  end

  def foodtag_params
    params.require(:photo).permit(:foodtags)
  end

end
