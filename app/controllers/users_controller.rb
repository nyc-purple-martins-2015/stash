class UsersController < ApplicationController
  def show
      # byebug
    if current_user.photos == []
      @error = "You don't have any photos! Go out and eat!"
    else
      @photos = current_user.photos
    end
  end
end
