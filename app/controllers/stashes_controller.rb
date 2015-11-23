class StashesController < ApplicationController
  def index
    if current_user.stash != nil
      # Can be misleading to name a variable something other than what it is.
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
