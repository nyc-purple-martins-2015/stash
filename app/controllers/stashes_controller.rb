class StashesController < ApplicationController

  def index

    @stash = current_user.stash.photos
    if @stash.any?
      render json: @stash.to_json
    else
      @error ="There's no food in your stash."
      render json: @error.to_json
    end
  end

  def new
    @stash = Stash.new
  end

  def create
    @stash = Stash.new(stash_params)
    if @stash.save
      render json: @stash.to_json
    else
      render :new
    end
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
