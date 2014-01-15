require 'spec_helper'

describe "yoddles/index" do
  before(:each) do
    assign(:yoddles, [
      stub_model(Yoddle,
        :title => "MyText",
        :content => "MyText",
        :url => "Url"
      ),
      stub_model(Yoddle,
        :title => "MyText",
        :content => "MyText",
        :url => "Url"
      )
    ])
  end

  it "renders a list of yoddles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
