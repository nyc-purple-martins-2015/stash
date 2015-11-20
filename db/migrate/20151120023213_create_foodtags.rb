class CreateFoodtags < ActiveRecord::Migration
  def change
    create_table :foodtags do |t|
      t.string  :description

      t.timestamps null: false
    end
  end
end
