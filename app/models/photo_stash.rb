class PhotoStash < ActiveRecord::Base
  belongs_to :photo
  belongs_to :stash
end
