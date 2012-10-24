require 'spec_helper'

describe "Cours" do
  describe "GET /cours" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cours_path
      response.status.should be(200)
    end
  end
end
