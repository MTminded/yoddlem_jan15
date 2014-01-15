require 'spec_helper'

describe "songs/show" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :title => "Title",
      :mp3 => "Mp3",
      :genre => "Genre",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Mp3/)
    rendered.should match(/Genre/)
    rendered.should match(/Description/)
  end
end
