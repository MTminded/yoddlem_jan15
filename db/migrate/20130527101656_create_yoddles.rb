class CreateYoddles < ActiveRecord::Migration
  def change
    create_table :yoddles do |t|
      t.text :title
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
