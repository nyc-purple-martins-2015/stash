class PricetagController < ApplicationController

  def index
    @pricetags = Pricetag.all
    render json: @pricetags.to_json
  end

  def new
    @pricetag = Pricetag.new
  end

  def create
    @pricetag = Pricetag.new(pricetag_params)
    if @pricetag.save
      # Pricetag is saved after the photo is saved. This should
      # render the user profile
    else
      render :new
  end

  #to show all price tags on search page

end
