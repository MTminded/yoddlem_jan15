class AddImageRemoteToYoddles < ActiveRecord::Migration
  def change
    add_column :yoddles, :image_remote_url, :string
  end
end
