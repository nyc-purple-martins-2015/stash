class PhotoPricetag < ActiveRecord::Base
  belongs_to :pricetag
  belongs_to :photo
end
