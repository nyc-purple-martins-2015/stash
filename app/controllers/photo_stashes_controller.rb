class PhotoStashesController < ApplicationController
  def destroy
    # byebug
    @stashed_photo = PhotoStash.find_by(stash_id: current_user.stash.id, photo_id: params[:id])
    @stashed_photo.destroy
    redirect_to user_stashes_path(current_user)
  end
end
