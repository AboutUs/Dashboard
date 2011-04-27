require 'spec_helper'

describe "data_points/edit.html.erb" do
  before(:each) do
    @data_point = assign(:data_point, stub_model(DataPoint,
      :family => "MyString",
      :name => "MyString",
      :value_num => 1,
      :value_str => "MyString"
    ))
  end

  it "renders the edit data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => data_points_path(@data_point), :method => "post" do
      assert_select "input#data_point_family", :name => "data_point[family]"
      assert_select "input#data_point_name", :name => "data_point[name]"
      assert_select "input#data_point_value_num", :name => "data_point[value_num]"
      assert_select "input#data_point_value_str", :name => "data_point[value_str]"
    end
  end
end
