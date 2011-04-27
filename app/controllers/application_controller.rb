class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_perspective
    session[:perspective_id] && Perspective.find(session[:perspective_id])
  end
  helper_method :current_perspective

  def current_perspective=(perspective)
    session[:perspective_id] = perspective.id
  end
end
