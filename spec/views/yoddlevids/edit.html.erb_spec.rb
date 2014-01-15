require 'spec_helper'

describe "yoddlevids/edit" do
  before(:each) do
    @yoddlevid = assign(:yoddlevid, stub_model(Yoddlevid,
      :content => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit yoddlevid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => yoddlevids_path(@yoddlevid), :method => "post" do
      assert_select "input#yoddlevid_content", :name => "yoddlevid[content]"
      assert_select "input#yoddlevid_title", :name => "yoddlevid[title]"
    end
  end
end
