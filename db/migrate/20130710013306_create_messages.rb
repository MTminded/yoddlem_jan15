class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :replied_to_message_id
      t.boolean :replied
      t.boolean :read, default: false

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end

  def self.down
    drop_table :messages
  end
end
