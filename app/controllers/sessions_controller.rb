class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: param[:email])
        if user.present? && user.authenticate(param[:password])
            session[:user_email] = user.email
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def destroy 
        session[:user_email] = nil
        redirect_to root_path, notice: "Logged out"
    end
end