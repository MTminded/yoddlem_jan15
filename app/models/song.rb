class Song < ActiveRecord::Base
  attr_accessible :description, :genre, :mp3, :title
  belongs_to :user

has_attached_file :mp3,
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

validates_attachment_presence :mp3
#validates_attachment_size :mp3, :less_than => 5.megabytes
validates_attachment_content_type :mp3, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
end
