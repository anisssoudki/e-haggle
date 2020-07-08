class SessionsController < ApplicationController

    def login
    end
  
    def create
      
      user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        redirect_to user_path(user)
      else
        flash.now[:alert] = "There was something wrong with your login details"
        redirect_to login_path
      end
    end
  
    def logout
      session.clear
      flash[:notice] = "Logged out"
      redirect_to root_path
    end

    private

    def session_params
      params.require('session').permit(:email, :password)
    end

end
