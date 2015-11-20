class PhotoStashController < ApplicationController
  def new
    @photostash = Photostash.new
  end

  def create
    @photostash = Photostash.new(photostash_params)
    if @photostash.save
      redirect_to root_path
    else
      render :new, @photostash.to_json
    end
  end

  def show
    @photostash = Photostash.find(params[:id])
    @stash_count = stash_count(@photostash.photo)
    render :show, @photostash.to_json
  end

  private

  def photostash_params
    params.require(:photostash).permit(:photo, :stash)
  end
end
