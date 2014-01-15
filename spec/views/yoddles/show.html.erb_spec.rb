require 'spec_helper'

describe "yoddles/show" do
  before(:each) do
    @yoddle = assign(:yoddle, stub_model(Yoddle,
      :title => "MyText",
      :content => "MyText",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
  end
end
