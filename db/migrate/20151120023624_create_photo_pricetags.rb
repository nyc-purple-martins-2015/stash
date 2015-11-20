class CreatePhotoPricetags < ActiveRecord::Migration
  def change
    create_table :photo_pricetags do |t|
      t.references  :photo, null: false
      t.references  :pricetag, null: false

      t.timestamps null: false
    end
  end
end
