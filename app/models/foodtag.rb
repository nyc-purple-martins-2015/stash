class Foodtag < ActiveRecord::Base
  has_many :foodtag_photos
  has_many :photos, through: :foodtag_photos

  def self.search(description)
    description = description.downcase
    where("description LIKE ?", "%#{description}%")
  end
end
