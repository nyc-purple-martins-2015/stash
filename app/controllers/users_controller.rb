class UsersController < ApplicationController
  def show
    if current_user.photos == []
      @error = "You don't have any photos! Go out and eat!"
    else
      @user_photos = current_user.photos
    end
  end
end
