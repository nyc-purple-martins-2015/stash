class PricetagsController < ApplicationController

  def index
    @pricetags = Pricetag.all
  end

  def show
    # Maybe move this into photos_controller as a collection route
    @photo_pricetags = Pricetag.find(params[:id]).photos
  end

  private

  #This is never used?
  def pricetag_search_params
    params[:id]
  end
end
