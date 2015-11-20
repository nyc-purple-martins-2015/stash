class PhotoPricetagController < ApplicationController
  def new
    @photo_pricetag = PhotoPricetag.new
  end

  def create
    @photo_pricetag = PhotoPricetag.new(photo_pricetag_params)
    if @photo_pricetag.save
      #render something?
    else
      #stay on photosaving page
    end
  end

  def show_pricetag_photos
    photo_pricetags = Photos.where( pricetag: photo_pricetag_params[:pricetag_id])

    photo_pricetags = photo_pricetags.map { |photo| photo.image }
    render json: photo_pricetags.to_json
  end

  private

  def photo_pricetag_params
    params.require(:photo_pricetag).permit(:photo_id, :pricetag_id)
  end

end
