class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.string :video_url
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :videos, :user_id
  end

  def self.down
  	drop_table :videos
  end
end
