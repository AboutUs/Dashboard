require 'spec_helper'

describe "data_points/index.html.erb" do
  before(:each) do
    assign(:data_points, [
      stub_model(DataPoint,
        :family => "Family",
        :name => "Name",
        :value_num => 1,
        :value_str => "Value Str"
      ),
      stub_model(DataPoint,
        :family => "Family",
        :name => "Name",
        :value_num => 1,
        :value_str => "Value Str"
      )
    ])
  end

  it "renders a list of data_points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value Str".to_s, :count => 2
  end
end
