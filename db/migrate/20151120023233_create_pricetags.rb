class CreatePricetags < ActiveRecord::Migration
  def change
    create_table :pricetags do |t|
      t.float    :price

      t.timestamps null: false
    end
  end
end
