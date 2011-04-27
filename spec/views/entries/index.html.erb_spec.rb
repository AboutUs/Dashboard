require 'spec_helper'

describe "entries/index.html.erb" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :perspective_id => 1,
        :family => "Family",
        :name => "Name",
        :featured => false,
        :hidden => false
      ),
      stub_model(Entry,
        :perspective_id => 1,
        :family => "Family",
        :name => "Name",
        :featured => false,
        :hidden => false
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
