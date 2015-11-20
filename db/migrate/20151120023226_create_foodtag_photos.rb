class CreateFoodtagPhotos < ActiveRecord::Migration
  def change
    create_table :foodtag_photos do |t|
      t.references  :foodtag, null: false
      t.references  :photo, null: false

      t.timestamps null: false
    end
  end
end
