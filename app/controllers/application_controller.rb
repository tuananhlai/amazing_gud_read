class ApplicationController < ActionController::Base
  def is_admin?
    redirect_to root_path unless session[:user_role] == "admin"
  end
  
  def has_login?
    redirect_to "/log_in" unless session[:user_id] != nil
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end  
end
