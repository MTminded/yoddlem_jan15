class AddAttachmentHeaderbackgroundToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :headerbackground
    end
  end

  def self.down
    drop_attached_file :users, :headerbackground
  end
end
