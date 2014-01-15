class AddUserIdToYoddlevids < ActiveRecord::Migration
  def change
    add_column :yoddlevids, :user_id, :integer
    add_index :yoddlevids, :user_id
  end
end
