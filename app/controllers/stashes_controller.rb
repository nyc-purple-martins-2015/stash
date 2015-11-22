class StashesController < ApplicationController

  def index
    if current_user.stash != nil
      @stash = current_user.stash.photos
    else
      @stash = []
    end
  end

  private

  def stash_params
    params.require(:stash).merge(user_id: current_user.id)
  end

end
