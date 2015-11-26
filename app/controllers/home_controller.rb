class HomeController < ApplicationController

  def index
    @photostream = Photo.all.limit(20)

  end

  def show
    lon = params[:long]
    lat = params[:lat]
    # photos = distance(lat, lon)
    # @photostream = Photos.where(the lng and lat are within a two mile radius of the current_user)
    @photostream = Photo.within(20, :origin => [lat,lon])
    # render json: @photostream.to_json(methods: [:image_url], :include => { :foodtags => {:only => :description}, :pricetag => {:only => :price}} )
  end

  def showall

    @photostream = Photo.all
    @photostream = @photostream.to_a.shuffle!.shuffle!.shuffle![0..30]
    render :show
  end

end


