class CreateFoodtagPhotos < ActiveRecord::Migration
  def change
    create_table :foodtag_photos do |t|
      t.integer  :foodtag_id, null: false
      t.integer  :photo_id, null: false

      t.timestamps null: false
    end
  end
end
