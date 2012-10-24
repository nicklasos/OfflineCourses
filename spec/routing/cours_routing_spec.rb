require "spec_helper"

describe CoursController do
  describe "routing" do

    it "routes to #index" do
      get("/cours").should route_to("cours#index")
    end

    it "routes to #new" do
      get("/cours/new").should route_to("cours#new")
    end

    it "routes to #show" do
      get("/cours/1").should route_to("cours#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cours/1/edit").should route_to("cours#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cours").should route_to("cours#create")
    end

    it "routes to #update" do
      put("/cours/1").should route_to("cours#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cours/1").should route_to("cours#destroy", :id => "1")
    end

  end
end
