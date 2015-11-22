class Pricetag < ActiveRecord::Base
  has_one :photo_pricetags
<<<<<<< 93285d2391df3d6dc310f6904a9adf89291b907e
  has_many :photos, through: :photo_pricetags
=======
  has_one :photos, through: :photo_pricetags

>>>>>>> Cleanup pricetag model, seeds, and controller.
end
