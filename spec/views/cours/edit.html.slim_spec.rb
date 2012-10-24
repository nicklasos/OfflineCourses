require 'spec_helper'

describe "cours/edit" do
  before(:each) do
    @cour = assign(:cour, stub_model(Cour,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit cour form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cours_path(@cour), :method => "post" do
      assert_select "input#cour_title", :name => "cour[title]"
      assert_select "textarea#cour_description", :name => "cour[description]"
    end
  end
end
