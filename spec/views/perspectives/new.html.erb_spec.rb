require 'spec_helper'

describe "perspectives/new.html.erb" do
  before(:each) do
    assign(:perspective, stub_model(Perspective,
      :name => "MyString",
      :show_by_default => false
    ).as_new_record)
  end

  it "renders new perspective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => perspectives_path, :method => "post" do
      assert_select "input#perspective_name", :name => "perspective[name]"
      assert_select "input#perspective_show_by_default", :name => "perspective[show_by_default]"
    end
  end
end
