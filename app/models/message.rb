class Message < ActiveRecord::Base

  attr_accessible :body, :read, :receiver, :receiver_id, :sender_id, :subject, :replied_to_message_id, :replied
  
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :replied_messages, class_name: "Message", foreign_key: "replied_to_message_id"
  belongs_to :replied_to_message, class_name: "Message", foreign_key: "replied_to_message_id"

  validates_presence_of :body, :subject, :sender, :receiver

  def unread?
  	!read
  end

end