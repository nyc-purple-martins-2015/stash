class PricetagsController < ApplicationController

  def show
    @photo_pricetags = Pricetag.find(params[:id]).photos
  end

end
