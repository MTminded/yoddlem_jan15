require 'spec_helper'

describe "yoddles/new" do
  before(:each) do
    assign(:yoddle, stub_model(Yoddle,
      :title => "MyText",
      :content => "MyText",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new yoddle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => yoddles_path, :method => "post" do
      assert_select "textarea#yoddle_title", :name => "yoddle[title]"
      assert_select "textarea#yoddle_content", :name => "yoddle[content]"
      assert_select "input#yoddle_url", :name => "yoddle[url]"
    end
  end
end
