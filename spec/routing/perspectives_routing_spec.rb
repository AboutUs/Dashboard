require "spec_helper"

describe PerspectivesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/perspectives" }.should route_to(:controller => "perspectives", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/perspectives/new" }.should route_to(:controller => "perspectives", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/perspectives/1" }.should route_to(:controller => "perspectives", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/perspectives/1/edit" }.should route_to(:controller => "perspectives", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/perspectives" }.should route_to(:controller => "perspectives", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/perspectives/1" }.should route_to(:controller => "perspectives", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/perspectives/1" }.should route_to(:controller => "perspectives", :action => "destroy", :id => "1")
    end

  end
end
