class Pricetag < ActiveRecord::Base
  has_one :photo_pricetag
  has_many :photos, through: :photo_pricetag
end
