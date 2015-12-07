class UsersController < ApplicationController
  def show
    if current_user.photos == []
      @error = "You don't have any photos! Go out and eat!"
    else
      @user_photos = current_user.photos
    end
  end

  def stash_photo
    @photo = Photo.find(params[:photoid])
    if !current_user.stash.photos.include?(@photo)
      current_user.stash.photos << Photo.find(params[:photoid])
      if @photo.dish_name
        render text: "You stashed #{@photo.dish_name}!"
      else
        render text: "You stashed that photo!"
      end
    else
      render text: "You already stashed that photo!"
    end
  end
end
