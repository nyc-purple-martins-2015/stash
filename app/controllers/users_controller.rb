class UsersController < ApplicationController
  def show
    if current_user.photos
      @photos = current_user.photos
    else
      @error = {message: "You don't have any photos! Go out and eat!"}
      @photos = []
    end
  end
end
