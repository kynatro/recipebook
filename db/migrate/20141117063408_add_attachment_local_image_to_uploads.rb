class AddAttachmentLocalImageToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :local_image
    end
  end

  def self.down
    remove_attachment :uploads, :local_image
  end
end
