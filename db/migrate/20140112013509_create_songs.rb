class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :mp3
      t.string :genre
      t.string :description

      t.timestamps
    end
  end
end
