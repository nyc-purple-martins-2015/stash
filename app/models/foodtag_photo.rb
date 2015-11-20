class FoodtagPhoto < ActiveRecord::Base
  belongs_to :foodtags
  belongs_to :photos
end
