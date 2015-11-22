class PricetagController < ApplicationController

  def index
    @pricetags = Pricetag.all
    render json: @pricetags.to_json
  end

  def show
    @photo_pricetags = Pricetag.find(pricetag_search_params).photos
  end

  #to show all price tags on search page
  private

  def pricetag_search_params
    params[:id]
  end

end
