class Pricetag < ActiveRecord::Base
  has_one :photo_pricetags
  has_many :photos, through: :photo_pricetags
end
