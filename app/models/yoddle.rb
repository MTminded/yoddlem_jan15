class Yoddle < ActiveRecord::Base
  

  attr_accessible :content, :title, :url, :image, :content, :name, :image_remote_url

  validates :content, presence: :true, 
  					:length => { :maximum => 1250,
  						 :too_long => "%{count} characters is the maximum allowed" }
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }





belongs_to :user
has_many :comments, as: :commentable
has_attached_file :image, styles: { medium: "320x240>"}

def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end


