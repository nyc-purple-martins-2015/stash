class UsersController < ApplicationController
  def show
    if current_user.photos == []
      @error = "You don't have any photos! Go out and eat!"
    else
      @photos = current_user.photos
      @stash_photos = current_user.stash.photos
    end
  end
end
