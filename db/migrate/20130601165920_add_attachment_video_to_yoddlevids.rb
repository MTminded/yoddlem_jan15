class AddAttachmentVideoToYoddlevids < ActiveRecord::Migration
  def self.up
    change_table :yoddlevids do |t|
      t.attachment :video
    end
  end

  def self.down
    drop_attached_file :yoddlevids, :video
  end
end
