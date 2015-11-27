class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(image: photo_params[:image], dish_name: photo_params[:dish_name], lat: photo_params[:lat].to_f, lng: photo_params[:lng].to_f, restaurant_name: photo_params[:restaurant_name], restaurant_rating: photo_params[:restaurant_rating], restaurant_address: photo_params[:restaurant_address], restaurant_phone: photo_params[:restaurant_phone], restaurant_website: photo_params[:restaurant_website])
    if @photo.save
    #remove debug stuff in master
    # byebug
      @photo.pricetag = Pricetag.find_by(price: params[:photo][:pricetag])
      @photo.associate_to_foodtags(foodtag_params[:foodtags].split(","))
      redirect_to user_path(current_user)
    else
      @error = "Please upload your photo!"
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

    #Is "you did not" right here - what about people looking at details later?
    # You could also use @photo.dish_name ||= 'Some default' rather than an if
    if @photo.dish_name == nil
      @photo.dish_name = "You didn't provide a dish name."
    end

    if @photo.restaurant_name == nil
      @photo.restaurant = "You did not provide the restaurant name for this dish."
    end
    # byebug

    #I think @photo.foodtags will be either an empty array or a 
    # collection so the for in doesn't need the guarding if in this case
    if @photo.foodtags
      for tag in @photo.foodtags
        foodtags << tag.description
      end
    end

    @photo_foodtags = foodtags.join(", ")
  end

  def update
    @photo = Photo.find(params[:id])
    #Update attributes does the save. If you want to update in 
    # memory then save use assign_attributes
    # In this can you could use just "if @photo.update_attributes" 
    # which will to update and save in one go - it will return 
    # false if it fails as save would
    @photo.update_attributes(photo_params)
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
    params.require(:photo).permit(:image, :dish_name, :lat, :lng, :restaurant_name, :restaurant_address, :restaurant_rating, :restaurant_phone, :restaurant_website)
  end

  def foodtag_params
    params.require(:photo).permit(:foodtags)
  end

end
