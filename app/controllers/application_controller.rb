# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "store"
  before_filter :authorize, :except => :login

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      if User.count == 0
        if request.path_parameters[:controller] == 'users' && (request.path_parameters[:action] == 'new' || request.path_parameters[:action] == 'create')
          #do nothing
        elsif !(request.path_parameters[:controller] == 'users' && request.path_parameters[:action] == 'new'|| request.path_parameters[:action] == 'create')
          flash[:notice] = "Please create first user"
          redirect_to :controller => 'users', :action => 'new'
        end
      elsif !User.find_by_id(session[:user_id])
        session[:original_uri] = request.request_uri
        flash[:notice] = "Please Log In"
        redirect_to :controller => 'admin', :action => 'login'
      end
    end
  end
end