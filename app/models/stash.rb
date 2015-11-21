class Stash < ActiveRecord::Base
  belongs_to :user
  has_many   :photo_stashes
  has_many   :photos, through: :photo_stashes

  def my_stash
    my_stash = self.find_by( user: current_user )
    if my_stash.count == 0
      alert("You haven't stashed anything yet!")
    else
      return my_stash
    end
  end
end
