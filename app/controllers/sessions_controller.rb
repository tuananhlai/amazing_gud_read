class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            # insecure by design, so no judging
            session[:user_email] = user.email
            session[:user_role] = user.role
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:danger] = "Invalid email or password"
            render :new
        end
    end

    def destroy 
        session[:user_email] = nil
        redirect_to root_path, notice: "Logged out"
    end
end
