require "spec_helper"

describe YoddlesController do
  describe "routing" do

    it "routes to #index" do
      get("/yoddles").should route_to("yoddles#index")
    end

    it "routes to #new" do
      get("/yoddles/new").should route_to("yoddles#new")
    end

    it "routes to #show" do
      get("/yoddles/1").should route_to("yoddles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/yoddles/1/edit").should route_to("yoddles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/yoddles").should route_to("yoddles#create")
    end

    it "routes to #update" do
      put("/yoddles/1").should route_to("yoddles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/yoddles/1").should route_to("yoddles#destroy", :id => "1")
    end

  end
end
