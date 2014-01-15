class AddUserIdToYoddles < ActiveRecord::Migration
  def change
    add_column :yoddles, :user_id, :integer
    add_index :yoddles, :user_id
  end
end
