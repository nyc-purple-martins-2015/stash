class CreatePhotoPricetags < ActiveRecord::Migration
  def change
    create_table :photo_pricetags do |t|
      t.integer  :photo_id, null: false
      t.integer  :pricetag_id, null: false

      t.timestamps null: false
    end
  end
end
