class CreatePhotoStashes < ActiveRecord::Migration
  def change
    create_table :photo_stashes do |t|
      t.references  :photo, null: false, index: true
      t.references  :stash, null: false, index: true

      t.timestamps null: false
    end
  end
end
