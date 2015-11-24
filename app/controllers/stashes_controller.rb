class StashesController < ApplicationController
  def index
    if current_user.stash.photos.count > 0
      @stash_photos = current_user.stash.photos
    else
      @error = "You don't have any food in your stash!"
    end
  end

end
