class FoodtagsController < ApplicationController

  def index
    @foodtags = Foodtag.all.sample(10)
    @pricetags = Pricetag.all

    if params[:search]
      search_tag = Foodtag.search(params[:search])
      if search_tag.count == 0
        @error = "There is no photo regarding this tag!"
        # redirect_to foodtags_path(@error)
        render :partial => "error"
      else
        tag_id = search_tag.first.id
        redirect_to foodtag_path(tag_id)
      end
    end
    # render foodtags_path
    # render json: @foodtags.to_json
  end


  def new
    @foodtag = Foodtag.new
  end

  def create
    @foodtag = Foodtag.new(foodtag_params)
    if @foodtag.save
      # Foodtag is saved after the photo is saved. This should
      # render the user profile

      render json: @foodtag.to_json
    else
      render :new
    end
  end

  #
  def show
    @foodtag_photos = Foodtag.find(foodtag_search_params).photos
    # render json: foodtag_photos.to_json(methods: [:image_url])
  end

  def parse_foodtags(photo, foodtag_params)
    foodtags = foodtag_params[:description].split(/[-,\/]/)
    foodtags = foodtags.map { |tag| Foodtag.find_or_create_by(description: foodtag.strip) }.uniq
    photo.foodtags.clear unless photo.foodtags.empty?

    foodtags.each do |tag|
      photo.foodtags << tag
    end
  end

  def autocomplete_tag_name
    foodtags = Foodtag.autocomplete_tag_name
  end

  private

  def foodtag_params
    params.require(:foodtag).permit(:description)
  end

  def foodtag_search_params
    params[:id]
  end

end
