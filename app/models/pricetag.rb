class Pricetag < ActiveRecord::Base
  has_many :photo_pricetags
  has_many :photos, through: :photo_pricetags
end
