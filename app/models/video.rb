class Video < ActiveRecord::Base
  attr_accessible :description, :title, :video_url
  belongs_to :user

  #Embeddeds Youtube video
  auto_html_for :video_url do
    html_escape
    image 
    youtube(:width => 600, :height => 350)
    vimeo(:width => 600, :height => 350)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end
