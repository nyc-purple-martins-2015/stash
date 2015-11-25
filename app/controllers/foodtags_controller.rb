class FoodtagsController < ApplicationController

  def index
    @foodtags = Foodtag.all.sample(10)
    @pricetags = Pricetag.all

    if params[:search]
      search_tag = Foodtag.search(params[:search])
      if search_tag.count == 0
        @error = "There are no photos for this tag!"
        render :partial => "error"
      else
        tag_id = search_tag.first.id
        redirect_to foodtag_path(tag_id)
      end
    end
  end


  def new
    @foodtag = Foodtag.new
  end

  def create
    @foodtag = Foodtag.new(foodtag_params)
    if @foodtag.save
      render json: @foodtag.to_json
    else
      render :new
    end
  end

  def show
    @foodtag_photos = Foodtag.find(foodtag_search_params).photos
  end

  def parse_foodtags(photo, foodtag_params)
    foodtags = foodtag_params[:description].split(/[-,\/]/)
    foodtags = foodtags.map { |tag| Foodtag.find_or_create_by(description: foodtag.strip) }.uniq
    photo.foodtags.clear unless photo.foodtags.empty?

    foodtags.each do |tag|
      photo.foodtags << tag
    end
  end

  private

  def foodtag_params
    params.require(:foodtag).permit(:description)
  end

  def foodtag_search_params
    params[:id]
  end

end
