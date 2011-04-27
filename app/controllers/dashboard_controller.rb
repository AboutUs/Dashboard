class DashboardController < ApplicationController
  def index
    if current_perspective
      redirect_to perspective_path(current_perspective)
    else
      flash[:notice] = 'Please select a perspective to view'
      redirect_to perspectives_path
    end
  end
end
