class UsersController < ApplicationController

  #Taken care of by omniauth?

  # def new
  # end

  # def create
  # end

  def show
    @photos = current_user.photos
    if @photos.any?
      render json: @photos.to_json(methods: [:user_stash_count])
    else
      @error = {message: "You don't have any photos! Go out and eat!"}
      render json: @error
    end
  end

end
