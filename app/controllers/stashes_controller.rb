class StashesController < ApplicationController

  def index
    if current_user.stash != nil
      @stash = current_user.stash.photos
    else
      @stash = []
    end
    # if @stash.any?
    #   render json: @stash.to_json
    # else
    #   @error ="There's no food in your stash."
    #   render json: @error.to_json
    # end
  end

  # def show
  #   stash = Stash.find_by(user: current_user).photos
  #   if stash
  #     render json: stash.to_json
  #   else
  #     @error = "There's no food in your stash."
  #     render json: @error.to_json, layout: false
  #   end
  # end

  private

  def stash_params
    params.require(:stash).merge(user_id: current_user.id)
  end

end
