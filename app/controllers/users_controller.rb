class UsersController < ApplicationController

  #Taken care of by omniauth?

  # def new
  # end

  # def create
  # end

  def show
    @photos = current_user.photos
    if @photos.any?
      redirect_to user_path(current_user)
      # render json: @photos.to_json(methods: [:image_url], only: [:id]), :show
    else
      @error = {message: "You don't have any photos! Go out and eat!"}
      render :show
    end
  end

end
