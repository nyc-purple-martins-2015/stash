class AddAttachmentImageToPhotos < ActiveRecord::Migration

  def self.up
    change_table :photos do |t|
      add_attachment :photos, :image
    end
  end

  def self.down
    remove_attachment :photos, :image
  end

end
