class CreatePricetags < ActiveRecord::Migration
  def change
    create_table :pricetags do |t|
      t.string   :price

      t.timestamps null: false
    end
  end
end