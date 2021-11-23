module SessionsHelper
    def current_user
      if email = session[:user_email]
        @current_user ||= User.find_by email: session[:user_email]
      end
    end
  
    def current_user? user
      user && user == current_user
    end
  
    def logged_in?
      current_user.present?
    end
end
  