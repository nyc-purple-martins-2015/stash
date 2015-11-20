class FoodtagPhoto < ActiveRecord::Base
  belongs_to :foodtag
  belongs_to :photo
end
