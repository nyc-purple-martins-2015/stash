class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references  :restaurant, null: false, index: true, foreign_key: true
      t.references  :user, null: false, index: true, foreign_key: true
      t.decimal     :lng, {:precision => 10, :scale=>6}
      t.decimal     :lat, {:precision => 10, :scale=>6}

      t.timestamps null: false
    end
  end
end
