class Stash < ActiveRecord::Base
  belongs_to :user
  has_many   :photo_stashes
  has_many   :photos, through: :photo_stashes

  def show_my_stash
    self.find_by( user: current_user )
  end

end
