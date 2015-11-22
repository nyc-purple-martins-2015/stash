class UsersController < ApplicationController
  def show
    @photos = current_user.photos
    if @photos.any?
      redirect_to user_path(current_user)
    else
      @error = {message: "You don't have any photos! Go out and eat!"}
      render :show
    end
  end
end
