class HomeController < ApplicationController

  def show
    #show photostream of current location of user

    # @photostream = Photos.where(the lng and lat are within a two mile radius of the current_user)

    @photostream = Photo.all #temporary

    render json: @photostream.to_json

  end


end
