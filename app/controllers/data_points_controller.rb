class DataPointsController < ApplicationController
  before_filter :require_http_authentication

  def new
    @data_point = DataPoint.new
  end

  def create
    DataPoint.save(params[:data_point][:family],
                   params[:data_point][:name],
                   params[:value],
                   Time.new)
    redirect_to '/'
  end
end
