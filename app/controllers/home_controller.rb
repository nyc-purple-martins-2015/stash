class HomeController < ApplicationController

  def index
    @photostream = Photo.all.limit(20)
  end

  def show
    lon = params[:long]
    lat = params[:lat]
    @photostream = Photo.within(20, :origin => [lat,lon])
  end

  def showall
    @photostream = Photo.all
    @photostream = @photostream.to_a.shuffle!.shuffle!.shuffle![0..30]
    render :show
  end

end


