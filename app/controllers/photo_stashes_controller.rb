class PhotoStashesController < ApplicationController
  def new
    @photostash = Photostash.new
  end

  def create
    @photostash = Photostash.new(photostash_params)
    if @photostash.save
      render json: @photostash.to_json
    else
      render :new
    end
  end

  def show
    @photostash = Photostash.find(params[:id])
    @stash_count = stash_count(@photostash.photo)
    render json: @photostash.to_json
  end



  private

  def photostash_params
    params.require(:photostash).permit(:photo, :stash)
  end
end
