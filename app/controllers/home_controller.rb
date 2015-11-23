class HomeController < ApplicationController

  def index
    @photostream = Photo.all.limit(20)
    @photostream = @photostream.to_json(methods: [:image_url], :include => { :foodtags => {:only => :description}, :pricetag => {:only => :price}} )

  end

  def show
    # @photostream = Photos.where(the lng and lat are within a two mile radius of the current_user)
    @photostream = Photo.all
    render json: @photostream.to_json(methods: [:image_url], :include => { :foodtags => {:only => :description}, :pricetag => {:only => :price}} )
  end
end
