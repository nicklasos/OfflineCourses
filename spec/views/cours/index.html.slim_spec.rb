require 'spec_helper'

describe "cours/index" do
  before(:each) do
    assign(:cours, [
      stub_model(Cour,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Cour,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of cours" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
