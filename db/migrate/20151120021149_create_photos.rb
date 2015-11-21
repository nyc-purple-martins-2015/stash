class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.references  :restaurant, index: true
      t.references  :user, null: false, index: true
      t.string      :dish_name

      t.decimal     :lng, {:precision => 10, :scale=>6}
      t.decimal     :lat, {:precision => 10, :scale=>6}

      t.timestamps null: false
    end
  end
end
