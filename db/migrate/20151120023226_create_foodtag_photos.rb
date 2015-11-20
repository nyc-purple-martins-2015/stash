class CreateFoodtagPhotos < ActiveRecord::Migration
  def change
    create_table :foodtag_photos do |t|
      t.references  :foodtag, null: false, foreign_key: true
      t.references  :photo, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
