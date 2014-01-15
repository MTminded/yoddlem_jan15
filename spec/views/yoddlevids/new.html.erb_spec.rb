require 'spec_helper'

describe "yoddlevids/new" do
  before(:each) do
    assign(:yoddlevid, stub_model(Yoddlevid,
      :content => "MyString",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new yoddlevid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => yoddlevids_path, :method => "post" do
      assert_select "input#yoddlevid_content", :name => "yoddlevid[content]"
      assert_select "input#yoddlevid_title", :name => "yoddlevid[title]"
    end
  end
end
