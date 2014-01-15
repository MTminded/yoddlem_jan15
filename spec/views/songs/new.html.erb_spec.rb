require 'spec_helper'

describe "songs/new" do
  before(:each) do
    assign(:song, stub_model(Song,
      :title => "MyString",
      :mp3 => "MyString",
      :genre => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => songs_path, :method => "post" do
      assert_select "input#song_title", :name => "song[title]"
      assert_select "input#song_mp3", :name => "song[mp3]"
      assert_select "input#song_genre", :name => "song[genre]"
      assert_select "input#song_description", :name => "song[description]"
    end
  end
end
