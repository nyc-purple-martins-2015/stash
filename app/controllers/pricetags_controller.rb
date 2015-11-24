class PricetagsController < ApplicationController

  def index
    @pricetags = Pricetag.all
  end

  def show
    @photo_pricetags = Pricetag.find(params[:id]).photos
  end

end
