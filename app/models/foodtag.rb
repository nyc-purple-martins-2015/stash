class Foodtag < ActiveRecord::Base
  has_many :foodtag_photos
  has_many :photos, through: :foodtag_photos
end
