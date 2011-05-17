class DashboardController < ApplicationController
  before_filter :require_http_authentication, :except => [:multi_create]
  
  def index
    if current_perspective
      redirect_to perspective_path(current_perspective)
    else
      flash[:notice] = 'Please select a perspective to view'
      redirect_to perspectives_path
    end
  end

  # Legacy support for original version of AboutUs Dashboard
  def multi_create
    my_params = params.dup
    my_params.delete :action
    my_params.delete :controller
    recorded_at = begin
                    time_code = my_params.delete(:time_code)
                    Time.at time_code
                  rescue
                    Time.new
                  end
    family = my_params.delete(:collection)
    my_params.each do |name, value|
      DataPoint.save family, name, value, recorded_at
    end

    render :text => 'ok'
  end
end
