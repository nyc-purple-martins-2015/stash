class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer  :restaurant_id, null: false
      t.integer  :user_id, null: false
      t.decimal  :lng, {:precision => 10, :scale=>6}
      t.decimal  :lat, {:precision => 10, :scale=>6}

      t.timestamps null: false
    end
  end
end
