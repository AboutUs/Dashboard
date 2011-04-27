require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe DataPointsController do

  def mock_data_point(stubs={})
    @mock_data_point ||= mock_model(DataPoint, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all data_points as @data_points" do
      DataPoint.stub(:all) { [mock_data_point] }
      get :index
      assigns(:data_points).should eq([mock_data_point])
    end
  end

  describe "GET show" do
    it "assigns the requested data_point as @data_point" do
      DataPoint.stub(:find).with("37") { mock_data_point }
      get :show, :id => "37"
      assigns(:data_point).should be(mock_data_point)
    end
  end

  describe "GET new" do
    it "assigns a new data_point as @data_point" do
      DataPoint.stub(:new) { mock_data_point }
      get :new
      assigns(:data_point).should be(mock_data_point)
    end
  end

  describe "GET edit" do
    it "assigns the requested data_point as @data_point" do
      DataPoint.stub(:find).with("37") { mock_data_point }
      get :edit, :id => "37"
      assigns(:data_point).should be(mock_data_point)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created data_point as @data_point" do
        DataPoint.stub(:new).with({'these' => 'params'}) { mock_data_point(:save => true) }
        post :create, :data_point => {'these' => 'params'}
        assigns(:data_point).should be(mock_data_point)
      end

      it "redirects to the created data_point" do
        DataPoint.stub(:new) { mock_data_point(:save => true) }
        post :create, :data_point => {}
        response.should redirect_to(data_point_url(mock_data_point))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved data_point as @data_point" do
        DataPoint.stub(:new).with({'these' => 'params'}) { mock_data_point(:save => false) }
        post :create, :data_point => {'these' => 'params'}
        assigns(:data_point).should be(mock_data_point)
      end

      it "re-renders the 'new' template" do
        DataPoint.stub(:new) { mock_data_point(:save => false) }
        post :create, :data_point => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested data_point" do
        DataPoint.stub(:find).with("37") { mock_data_point }
        mock_data_point.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :data_point => {'these' => 'params'}
      end

      it "assigns the requested data_point as @data_point" do
        DataPoint.stub(:find) { mock_data_point(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:data_point).should be(mock_data_point)
      end

      it "redirects to the data_point" do
        DataPoint.stub(:find) { mock_data_point(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(data_point_url(mock_data_point))
      end
    end

    describe "with invalid params" do
      it "assigns the data_point as @data_point" do
        DataPoint.stub(:find) { mock_data_point(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:data_point).should be(mock_data_point)
      end

      it "re-renders the 'edit' template" do
        DataPoint.stub(:find) { mock_data_point(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested data_point" do
      DataPoint.stub(:find).with("37") { mock_data_point }
      mock_data_point.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the data_points list" do
      DataPoint.stub(:find) { mock_data_point }
      delete :destroy, :id => "1"
      response.should redirect_to(data_points_url)
    end
  end

end