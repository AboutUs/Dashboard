require 'spec_helper'

describe "data_points/new.html.erb" do
  before(:each) do
    assign(:data_point, stub_model(DataPoint,
      :family => "MyString",
      :name => "MyString",
      :value_num => 1,
      :value_str => "MyString"
    ).as_new_record)
  end

  it "renders new data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => data_points_path, :method => "post" do
      assert_select "input#data_point_family", :name => "data_point[family]"
      assert_select "input#data_point_name", :name => "data_point[name]"
      assert_select "input#data_point_value_num", :name => "data_point[value_num]"
      assert_select "input#data_point_value_str", :name => "data_point[value_str]"
    end
  end
end
