class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_perspective
    session[:perspective_id] && Perspective.find(session[:perspective_id])
  end
  helper_method :current_perspective

  def current_perspective=(perspective)
    session[:perspective_id] = perspective.id
  end

  def require_http_authentication
    return if AUTH_PARAMS.empty?
    authenticate_or_request_with_http_basic do |username, password|
      username == AUTH_PARAMS[:username] && password == AUTH_PARAMS[:password]
    end
  end

end
