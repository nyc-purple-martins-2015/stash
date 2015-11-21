class UsersController < ApplicationController

  #Taken care of by omniauth?

  # def new
  # end

  # def create
  # end

  def show
    @user = User.find(current_user)
    render json: @user.to_json
  end

  def stash

  end

  def my_photos
    @photo = Photo.find_by(user: current_user)
    if @photo
      render json: @photo.to_json
    else
      @error = {message: "You don't have any photos! Go out and eat!"}
      render json: @error
    end
  end

end
