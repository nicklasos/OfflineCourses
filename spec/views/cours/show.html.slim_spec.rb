require 'spec_helper'

describe "cours/show" do
  before(:each) do
    @cour = assign(:cour, stub_model(Cour,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
