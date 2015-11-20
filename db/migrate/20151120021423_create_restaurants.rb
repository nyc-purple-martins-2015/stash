class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string   :name, null:false
      t.decimal  :lng, {:precision => 10, :scale=>6}
      t.decimal  :lat, {:precision => 10, :scale=>6}

      t.timestamps null: false
    end
  end
end
