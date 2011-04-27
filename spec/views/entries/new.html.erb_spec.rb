require 'spec_helper'

describe "entries/new.html.erb" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :perspective_id => 1,
      :family => "MyString",
      :name => "MyString",
      :featured => false,
      :hidden => false
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => entries_path, :method => "post" do
      assert_select "input#entry_perspective_id", :name => "entry[perspective_id]"
      assert_select "input#entry_family", :name => "entry[family]"
      assert_select "input#entry_name", :name => "entry[name]"
      assert_select "input#entry_featured", :name => "entry[featured]"
      assert_select "input#entry_hidden", :name => "entry[hidden]"
    end
  end
end
