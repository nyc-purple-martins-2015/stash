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

end
