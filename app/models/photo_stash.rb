class PhotoStash < ActiveRecord::Base
  belongs_to :photo
  belongs_to :stash

  def stash_count(photo_id)
    self.find_by(photo: photo_id).count
  end
end
