require 'spec_helper'

describe "data_points/show.html.erb" do
  before(:each) do
    @data_point = assign(:data_point, stub_model(DataPoint,
      :family => "Family",
      :name => "Name",
      :value_num => 1,
      :value_str => "Value Str"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value Str/)
  end
end
