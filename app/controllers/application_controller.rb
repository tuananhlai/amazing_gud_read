class ApplicationController < ActionController::Base
  def is_admin?
    redirect_to root_path unless session[:user_role] == "admin"
  end
end
