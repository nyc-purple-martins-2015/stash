class StashesController < ApplicationController

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

  def show
    @my_stash = show_my_stash
    if @stash.any?
      render json: @stash.to_json
    else
      @error = { message: "There's no food in your stash." }
      render json: @error.to_json
    end
  end

  private

  def stash_params
    params.require(:stash).merge(user_id: current_user.id)
  end

end
