class PhotoStashesController < ApplicationController
  def destroy
    @stashed_photo = Photo.find(params[:id])
    byebug
    @stash_photo.destroy
  end
end
