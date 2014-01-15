require 'spec_helper'

describe "yoddles/edit" do
  before(:each) do
    @yoddle = assign(:yoddle, stub_model(Yoddle,
      :title => "MyText",
      :content => "MyText",
      :url => "MyString"
    ))
  end

  it "renders the edit yoddle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => yoddles_path(@yoddle), :method => "post" do
      assert_select "textarea#yoddle_title", :name => "yoddle[title]"
      assert_select "textarea#yoddle_content", :name => "yoddle[content]"
      assert_select "input#yoddle_url", :name => "yoddle[url]"
    end
  end
end
