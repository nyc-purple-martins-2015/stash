class HomeController < ApplicationController

  def index

  end

  def show
    # @photostream = Photos.where(the lng and lat are within a two mile radius of the current_user)
    @photostream = Photo.first
    render json: @photostream.to_json(methods: [:image_url, :image_path])
  end


end
