class CreatePhotoPricetags < ActiveRecord::Migration
  def change
    create_table :photo_pricetags do |t|
      t.references  :photo, null: false, foreign_key: true
      t.references  :pricetag, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
