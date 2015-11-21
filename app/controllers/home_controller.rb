class HomeController < ApplicationController

  def index

  end

  def show
    # @photostream = Photos.where(the lng and lat are within a two mile radius of the current_user)
    @photostream = Photo.all
    render json: @photostream.to_json
  end


end
