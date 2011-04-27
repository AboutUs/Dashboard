require "spec_helper"

describe DataPointsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/data_points" }.should route_to(:controller => "data_points", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/data_points/new" }.should route_to(:controller => "data_points", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/data_points/1" }.should route_to(:controller => "data_points", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/data_points/1/edit" }.should route_to(:controller => "data_points", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/data_points" }.should route_to(:controller => "data_points", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/data_points/1" }.should route_to(:controller => "data_points", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/data_points/1" }.should route_to(:controller => "data_points", :action => "destroy", :id => "1")
    end

  end
end
