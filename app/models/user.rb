class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :avatar, :name, :email, :password, :password_confirmation, :remember_me, :content, :headerbackground, :video
  # attr_accessible :title, :body

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
  					uniqueness: { case_sensitive: false }
  

  has_many :yoddles, :dependent => :destroy
  has_attached_file :avatar,
   :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
   :url => "/system/:attachment/:id/:style/:filename",
   :styles => { :large => "300x300>", :medium => "200x200>", :small => "75x75", :thumb => "50x50" } 
   has_attached_file :headerbackground,
   :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
   :url => "/system/:attachment/:id/:style/:filename",
   :styles => { :original => "500x500>", :large => "760x424", :medium => "425x250", thumb: "250x250#"} 
   has_many :yoddlevids, :dependent => :destroy
   has_many :microposts, :dependent => :destroy
   has_many :relationships, foreign_key: "follower_id", dependent: :destroy
   has_many :followed_users, through: :relationships, source: :followed
   has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :messages
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :unread_messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :songs, :dependent => :destroy

  has_many :users, dependent: :destroy

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.from_users_followed_by(self)
  end 

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end
