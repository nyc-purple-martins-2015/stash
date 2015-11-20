class CreateStashes < ActiveRecord::Migration
  def change
    create_table :stashes do |t|
      t.references  :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
