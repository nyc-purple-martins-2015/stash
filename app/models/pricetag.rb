class Pricetag < ActiveRecord::Base
  has_one :photo_pricetags
  has_one :photos, through: :photo_pricetags
end
