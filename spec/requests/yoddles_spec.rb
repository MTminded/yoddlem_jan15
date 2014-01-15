require 'spec_helper'

describe "Yoddles" do
  describe "GET /yoddles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get yoddles_path
      response.status.should be(200)
    end
  end
end
